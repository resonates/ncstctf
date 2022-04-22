import json
import random
import string
from datetime import datetime, timedelta

import docker
from flask import Blueprint, request
from flask import render_template
from sqlalchemy import func, desc
from docker import errors as docker_error
from applications.common.utils.http import fail_api, success_api
from applications.extensions import db
from applications.models import User
from applications.models.ctf import Question, Answer, ContainerResource, ImageResource

timu_bp = Blueprint('timu', __name__, url_prefix='/timu')


def generate_flag():
    """
        生成flag
        return generate flag
    """
    rd_str = ''.join(random.sample(string.ascii_letters + string.digits, 32))
    return "flag{ocean%s}" % rd_str


# 题目管理
@timu_bp.get('/')
def main():
    return render_template('admin/timu/main.html')


@timu_bp.route('/challenge', methods=['get'])
def challenge_list():
    """
        题目列表
    :return:
    """
    user = g.user
    if user:
        solved = [i[0] for i in
                  db.session.query(Answer.question_id).filter(Answer.user_id == user.id,
                                                              Answer.status == Answer.status_ok)]
    else:
        solved = []
    # 每个题目的解题人数
    solved_query = db.session.query(Answer.question_id, func.count(Answer.id)).filter(
        Answer.status == Answer.status_ok).group_by(Answer.question_id).all()
    solved_cnt_dict = {i[0]: i[1] for i in solved_query}
    subjects = request.args.get("subject")
    query = db.session.query(Question).filter(Question.active == 1)
    if subjects:
        query = query.filter(Question.type == subjects)
    data = []
    for item in query:
        data.append({
            "id": item.id,
            "type": item.type,
            "title": item.name,
            "score": item.score,
            "desc": item.desc,
            "active_flag": item.active_flag,
            "solved_cnt": solved_cnt_dict.get(item.id, 0),
            "is_solved": bool(item.id in solved)
        })
    return {
        "msg": "not data",
        "count": data.count(),
        "data": data}


@timu_bp.route('/data', methods=['get'])
def question_list():
    return {
        "msg": "not data",
        "count": 30,
        "data": [{
            "id": "1",
            "image": "https://gw.alipayobjects.com/zos/rmsportal/gLaIAoVWTtLbBWZNYEMg.png",
            "title": "简单sql注入",
            "remark": "测试题",
            "time": "未答题"
        }, {
            "id": "2",
            "image": "https://gw.alipayobjects.com/zos/rmsportal/iXjVmWVHbCJAyqvDxdtx.png",
            "title": "xss注入",
            "remark": "测试题",
            "time": "未答题"
        }
        ],
        "code": 0
    }


@timu_bp.route('/challenge/<int:question>', methods=['get'])
def challenge_detail(question):
    """
        题目详情 包括已解决的用户情况  点赞情况
    :param question:
    :return:
    """
    instance = db.session.query(Question).get(question)
    if not instance:
        return fail_api(msg="题目不存在、请刷新页面！")
    answer_object = db.session.query(Answer).filter(Answer.user_id == g.user.id, Answer.status == Answer.status_ok,
                                                    Answer.question_id == question).first()
    container = db.session.query(ContainerResource).filter(ContainerResource.user_id == g.user.id,
                                                           ContainerResource.question_id == instance.id,
                                                           ContainerResource.destroy_time > datetime.now()).first()
    # 获取前三名
    ans = db.session.query(User.username).select_from(Answer).filter(Answer.question_id == question,
                                                                     Answer.status == Answer.status_ok,
                                                                     Answer.rank <= 3).join(User,
                                                                                            User.id == Answer.user_id)
    ans = [i[0] for i in ans]
    ans = list(ans) + [None] * (3 - len(list(ans)))
    first_blood, second_blood, third_blood = ans

    if container:
        container_data = {
            "create_time": container.date_created.strftime("%Y-%m-%d %H:%M:%S"),
            "url": "http://{}:{}".format(container.addr, container.container_port),
            "destroy_time": container.destroy_time.strftime("%Y-%m-%d %H:%M:%S"),
            "seconds": (container.destroy_time - container.date_created).total_seconds()
        }
    else:
        container_data = None

    get_score = answer_object.score if answer_object else None
    att = json.loads(instance.attachment) if instance.attachment else []
    data = {
        "first_blood": first_blood,
        "second_blood": second_blood,
        "third_blood": third_blood,
        "container": container_data,
        "get_score": get_score,
        "score": instance.score,
        "id": instance.id,
        "name": instance.name,
        "attachment": [{"name": i["name"], "url": "/api/upload/{}?filename={}".format(i["filename"], i["name"])} for i
                       in att],
        "desc": instance.desc,
        "active_flag": instance.active_flag,
        "type": instance.type,
        "solved": db.session.query(Answer).filter(Answer.question_id == instance.id,
                                                  Answer.status == Answer.status_ok).count(),
        "date_created": instance.date_created.strftime("%y-%m-%d")
    }
    return success_api(data)


@timu_bp.route('/challenge/<int:question>/start', methods=['POST'])
def question_start(question):
    """
        创建一个题目容器
    :param question:
    :return:
    """
    user = g.user
    instance = db.session.query(Question).get(question)
    if not instance.active_flag:
        return fail_api(msg="静态题库无需动态生成")
    image_resource = instance.image
    if not image_resource:
        return fail_api(msg="服务器没有资源")
    connect_url = image_resource.host.docker_api
    client = docker.DockerClient(connect_url)
    try:
        image = client.images.get('{}:{}'.format(image_resource.name, image_resource.version))
    except docker_error.ImageNotFound:
        return fail_api(msg="当前题目环境缺失、请联系管理员！")
    # 解析镜像端口
    image_config = image.attrs["ContainerConfig"]
    random_port = ""
    if "ExposedPorts" in image_config:
        port_dict = image.attrs["ContainerConfig"]["ExposedPorts"]
        for docker_port, host_port in port_dict.items():
            # docker_port_int = docker_port.replace("/", "").replace("tcp", "").replace("udp", "")
            random_port = str(random.randint(20000, 65535))
            port_dict[docker_port] = random_port
    else:
        port_dict = {}
    image_name = image.attrs["RepoTags"][0].replace(":", ".")
    container_name = f"{image_name}_{user.id}"
    # 检查docker 是否已存在
    try:
        c = client.containers.get(container_name)
        c.stop()
        c.remove()
    except docker_error.NotFound:
        pass
    try:
        docker_container_response = client.containers.run(image=image.id, name=container_name, ports=port_dict,
                                                          detach=True)
    except docker_error.APIError as e:
        # logger.exception(e)
        return fail_api(msg="题目启动失败")
    # 获取创建的容器
    docker_container = client.containers.get(container_name)
    flag = generate_flag()
    command = "/start.sh '{}'".format(flag)
    docker_container.exec_run(cmd=command, detach=True)
    # 创建容器记录
    container = ContainerResource(image_resource_id=image_resource.id, flag=flag, question_id=question)
    container.addr = image_resource.host.ip
    container.container_id = docker_container_response.attrs["Id"]
    container.image_id = image.attrs["Id"]
    container.container_name = container_name
    container.container_status = docker_container_response.attrs["State"]["Status"]
    container.container_port = random_port
    container.user_id = user.id
    # 销毁时间
    container.destroy_time = datetime.now() + timedelta(minutes=10)
    # 创建容器
    db.session.add(container)
    db.session.commit()
    # 创建定时任务  到时间后销毁
    #  ***************************************************************************
    #  ***************************************************************************
    #  ***************************************************************************
    #  ***************************************************************************
    # scheduler.add_job("finish_container_{}".format(container.id), finish_container,trigger='date', args=(container.id,),
    #                   next_run_time=datetime.now() + timedelta(minutes=10))
    return success_api()


@timu_bp.route('/challenge/<int:question>/delayed', methods=['POST'])
def question_delayed(question):
    """
        延长容器时间
    :param question:
    :return:
    """
    container = db.session.query(ContainerResource).filter(ContainerResource.user_id == g.user.id,
                                                           ContainerResource.question_id == question).order_by(
        desc(ContainerResource.id)).first()
    if not container:
        return fail_api("当前状态无法延长题目时间")
    # 最多延长三小时
    if (container.destroy_time - timedelta(hours=3)) > datetime.now():
        return fail_api("时间已达上限")
    container.destroy_time = container.destroy_time + timedelta(minutes=10)
    db.session.commit()

    return success_api()


@timu_bp.route('/challenge/<int:question>/destroy', methods=['POST'])
def question_destroy(question):
    """
        销毁容器
    :param question:
    :return:
    """
    instance = db.session.query(Question).get(question)
    if not instance.active_flag:
        return fail_api("静态题库无需动态生成")
    containers = db.session.query(ContainerResource, ImageResource).join(ImageResource,
                                                                         ImageResource.id == ContainerResource.image_resource_id). \
        filter(ImageResource.id == instance.image_id, ContainerResource.user_id == g.user.id)
    for (container, image_resource) in containers:
        try:
            client = docker.DockerClient(image_resource.host.docker_api, timeout=3)
            docker_container = client.containers.get(container.container_id)
            docker_container.kill()
            docker_container.remove()
        except docker_error.DockerException:
            pass
        db.session.delete(container)
    db.session.commit()
    return success_api()

# @timu_bp.route('/data', methods=['get'])
# def question_list():
#     """
#         题库列表 和题库添加
#         :data :subject 题目分类
#     :return:
#     """
#     page = int(request.args.get('page', 1))
#     page_size = int(request.args.get("limit", 10))
#     subject = request.args.get("subject")
#     search = request.args.get('search')
#     query = db.session.query(Question)
#     if subject:
#         query = query.filter(Question.type == subject)
#     if search:
#         query = query.filter(Question.name.contains(search))
#     page = query.order_by(Question.id.desc()).paginate(page=page, per_page=page_size)
#     data = []
#     for item in page.items:
#         if item.active and item.image:
#             host_id = item.image.host_id
#         else:
#             host_id = None
#         data.append({
#             "attachment": json.loads(item.attachment) if item.attachment else None,
#             "host_id": host_id,
#             "image_id": item.image_id,
#             "id": item.id,
#             "date_created": item.date_created.strftime("%Y-%m-%d %H:%M:%S") if item.date_created else None,
#             "date_modified": item.date_modified.strftime("%Y-%m-%d %H:%M:%S") if item.date_modified else None,
#             "name": item.name,
#             'type': item.type,
#             "active": item.active,
#             "flag": item.flag,
#             "active_flag": item.active_flag,
#             "score": item.score,
#             "desc": item.desc
#         })
#     return jsonify({
#         "count": page.total,
#         "data": data
#     })
@bp.route('challenge/submit', methods=["post"])
def challenge_submit():
    ip = get_ip()
    data = request.get_json()
    question_id = data.get("id")
    flag = data.get("flag")
    code, msg = FrontendService.submit(question_id, flag, g.user, ip=ip)
    if code:
        return fail(code, msg)
    else:
        return success(msg=msg)