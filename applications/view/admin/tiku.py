import json

import docker
from flask import Blueprint, jsonify, request
from flask import render_template
from docker import errors as docker_error
from applications.common.utils.http import table_api, fail_api
from applications.extensions import db
from applications.models import User, Host
from applications.models.ctf import Question, ContainerResource, ImageResource, Answer, QuestionFile

tiku_bp = Blueprint('tiku', __name__, url_prefix='/tiku')


@tiku_bp.get('/')
def main():
    return render_template('admin/tiku/main.html')


@tiku_bp.route('/data', methods=['get'])
def question_list():
    """
        题库列表 和题库添加
        :data :subject 题目分类
    :return:
    """
    page = int(request.args.get('page', 1))
    page_size = int(request.args.get("page_size", 10))
    subject = request.args.get("subject")
    search = request.args.get('search')
    query = db.session.query(Question)
    if subject:
        query = query.filter(Question.type == subject)
    if search:
        query = query.filter(Question.name.contains(search))
    page = query.order_by(Question.id.desc()).paginate(page=page, per_page=page_size)
    data = []
    for item in page.items:
        if item.active and item.image:
            host_id = item.image.host_id
        else:
            host_id = None
        data.append({
            "attachment": json.loads(item.attachment) if item.attachment else None,
            "host_id": host_id,
            "image_id": item.image_id,
            "id": item.id,
            "date_created": item.date_created.strftime("%Y-%m-%d %H:%M:%S") if item.date_created else None,
            "date_modified": item.date_modified.strftime("%Y-%m-%d %H:%M:%S") if item.date_modified else None,
            "name": item.name,
            'type': item.type,
            "active": item.active,
            "flag": item.flag,
            "active_flag": item.active_flag,
            "score": item.score,
            "desc": item.desc
        })
    return table_api(data=data,count=page.total)

@tiku_bp.get('/add')
def question_add():
    instance = db.session.query(Host).all()
    image_list = []
    for i in instance:
        try:
            client = docker.DockerClient(i.docker_api)
            images = client.images.list()
            for im in images:
                attrs = im.attrs
                if not attrs["RepoTags"]:
                    continue
                tmp = {
                    "created": attrs["Created"].split("T")[0],
                    "id": attrs["Id"][7:17],
                    "size": attrs["Size"],
                    "repo": attrs["RepoTags"][0].split(":")[0],
                    "tags": [i.split(":")[1] for i in attrs["RepoTags"]]
                }
                image_list.append(tmp)
        except docker_error.DockerException:
            print("有问题")
    return render_template('admin/tiku/add.html',image_list=image_list)

@tiku_bp.post('/add')
def question_create():
    data = request.get_json()
    name = data["name"]
    active = bool(data["active"])
    active_flag = bool(data["active_flag"])
    desc = data["desc"]
    flag = data["flag"]
    q_type = data["type"]
    score = data["score"]
    image_id = data.get("image_id")
    attachment = data.get('attachment', [])
    if not name:
        return fail_api("名称字段不允许为空")
    question = Question(name=name,
                        active=active,
                        active_flag=active_flag,
                        desc=desc,
                        flag=flag,
                        type=q_type,
                        score=score,
                        image_id=image_id)
    db.session.add(question)
    db.session.flush()
    if attachment:
        for file in attachment:
            db.session.add(
                QuestionFile(question_id=question.id, filename=file["filename"], file_path=file["file_path"]))

    db.session.commit()
    return jsonify({})


@tiku_bp.route('/question/<int:pk>', methods=['put'])
def question_update(pk):
    """
                    修改题目
                :param question: 题目ID
                :return:
                @param pk:
                """
    data = request.get_json()
    instance = db.session.query(Question).get(pk)
    name = data.get("name")
    _type = data.get("type")
    active_flag = data.get("active_flag")
    score = data.get("score")
    flag = data.get("flag")
    desc = data.get("desc")
    image_id = data.get("image_id")
    if active_flag is not None:
        instance.active_flag = active_flag
    if name is not None:
        instance.name = name
    if score is not None:
        instance.score = score
    if _type is not None:
        instance.type = _type
    if image_id is not None:
        instance.image_id = image_id
    if desc is not None:
        instance.desc = desc
    attachment = data.get('attachment', [])
    active = data.get("active")
    if active is not None:
        instance.active = active
    # if attachment is not None:
    #     # 删除之前的数据  重新关联  这里可以判断优化一下
    #     db.session.query(QuestionFile).filter(QuestionFile.question_id == instance.id).delete()
    #     for file in attachment:
    #         db.session.add(
    #             QuestionFile(question_id=pk, filename=file["filename"], file_path=file["file_path"]))
    instance.attachment = json.dumps(attachment)
    if active_flag is not None:
        if not active_flag:
            instance.flag = flag
    db.session.commit()
    return jsonify({})


@tiku_bp.route('/question/<int:pk>', methods=['DELETE'])
def question_delete(pk):
    """
                    删除题库  判断是否是动态题库 动态题库删除容器  实体容器 镜像
                    :param : question 题目ID
                """
    instance = db.session.query(Question).get(pk)
    if instance.active_flag:
        containers = db.session.query(ContainerResource).join(ImageResource,
                                                              ImageResource.id == ContainerResource.image_resource_id)
        # kill
        for container in containers:
            db.session.delete(container)
            client = docker.DockerClient(container.image.host.docker_api)
            docker_container = client.containers.get(container.container_id)
            docker_container.stop()
            container.status = 2
    # 删除镜像

    db.session.delete(instance)

    db.session.commit()
    return jsonify({})


@tiku_bp.get('/containers')
def containers():
    """
    赛事容器
    """
    return render_template('admin/tiku/containers.html')


@tiku_bp.get('/containers/data')
def containers_data():
    """
    赛事容器
    """
    page = int(request.args.get('page', 1))
    page_size = int(request.args.get("page_size", 10))
    username = request.args.get("username")
    question_name = request.args.get("question")
    query = db.session.query(ContainerResource, ImageResource, Question, User).join(ImageResource,
                                                                                    ImageResource.id == ContainerResource.image_resource_id) \
        .join(Question, Question.image_id == ImageResource.id) \
        .join(User, ContainerResource.user_id == User.id)
    if username:
        query = query.filter(User.username.ilike("%{}%".format(username)))
    if question_name:
        query = query.filter(Question.name.ilike("%{}%".format(question_name)))
    page = query.order_by(ContainerResource.id.desc()).paginate(page=page, per_page=page_size)
    data = []
    for item in page.items:
        container_resource, image_resource, question, user_obj = item
        data.append({
            "image": "{}:{}".format(image_resource.name, image_resource.version),
            "container_resource": container_resource.id,
            "date_created": container_resource.date_created.strftime(
                "%Y-%m-%d %H:%M:%S") if container_resource.date_created else None,
            "date_modified": container_resource.date_modified.strftime(
                "%Y-%m-%d %H:%M:%S") if container_resource.date_modified else None,
            "container_name": container_resource.container_name,
            "container_id": container_resource.container_id,
            "container_status": container_resource.container_status,
            "container_port": container_resource.container_port,
            "addr": container_resource.addr,
            "flag": container_resource.flag,
            "destroy_time": container_resource.destroy_time.strftime(
                "%Y-%m-%d %H:%M") if container_resource.destroy_time else None,
            "username": user_obj.username,
            "question": {
                "name": question.name
            }
        })
    return table_api(data=data)


@tiku_bp.route('/answers', methods=['get'])
def answers_list():
    return render_template('admin/tiku/answers.html')


@tiku_bp.route('/answers/data', methods=['get'])
def answers_list_data():
    """
        答题记录
    :return:
    """
    page = int(request.args.get('page', 1))
    page_size = int(request.args.get("page_size", 10))
    _type = request.args.get("q_type")
    status = request.args.get("status")
    question_name = request.args.get("question")
    username = request.args.get('username')
    query = db.session.query(Answer, Question, User) \
        .join(Question, Question.id == Answer.question_id) \
        .join(User, User.id == Answer.user_id)
    if _type is not None:
        query = query.filter(Question.type == _type)
    if status is not None:
        query = query.filter(Answer.status == status)
    if username:
        query = query.filter(User.username.contains(username))
    if question_name:
        query = query.filter(Question.name.contains(question_name))
    page = query.order_by(Answer.id.desc()).paginate(page=page, per_page=page_size)
    data = []
    for item in page.items:
        answer, question, user = item
        data.append({
            "id": answer.id,
            "date_created": answer.date_created.strftime("%Y-%m-%d %H:%M:%S") if answer.date_created else None,
            "date_modified": answer.date_modified.strftime("%Y-%m-%d %H:%M:%S") if answer.date_modified else None,
            "status": answer.status,
            "status_name": answer.status_name,
            "question": {
                "type": question.type,
                "name": question.name
            },
            "score": answer.score,
            "flag": answer.flag,
            "username": user.username,
            "ip": answer.ip
        })
    return table_api(data=data, count=page.total)
