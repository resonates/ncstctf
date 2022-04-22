import json
import logging
import os

import docker
from docker import errors as docker_error
from flask import Blueprint, make_response, jsonify, request
from flask import current_app
from applications.extensions import db
# from app import db, scheduler
# from app.lib import exceptions
from applications.common.utils.http import fail_api, success_api, table_api
from applications.models.ctf import QType, ImageResource, ContainerResource, Answer, QuestionFile
from applications.models.ctf import Question
from applications.models.docker import Host
from applications.models import User

# from app.tasks.ctf import build_question_tar

logger = logging.getLogger('app')
bp = Blueprint("admin_ctf", __name__, url_prefix="/ctf")


@bp.route('/question/type', methods=['get'])
def question_type():
    """
        题库列表
    :return:
    """
    data = [i.value for i in QType]
    return jsonify({
        "results": data
    })


@bp.route('/containers/<int:container_resource>/refresh', methods=['post'])
def ctf_containers_refresh(container_resource):
    """
        刷新容器状态 数据库和实际容器状态同步
        :param :container_resource :题目容器
        :return
    """

    item = db.session.query(ContainerResource, ImageResource, Question, User).join(ImageResource,
                                                                                   ImageResource.id == ContainerResource.image_resource_id) \
        .join(Question, Question.id == ImageResource.question_id) \
        .join(User, ContainerResource.user_id == User.id) \
        .filter(ContainerResource.id == container_resource).one_or_none()
    container_resource, image_resource, question, user_obj = item
    try:
        client = docker.DockerClient(container_resource.image_resource.host.docker_api)
        docker_container = client.containers.get(container_resource.container_id)
    except docker_error.DockerException:
        container_resource.container_status = "Outline".lower()
        db.session.commit()
        return make_response(jsonify({"msg": "容器不在线"}))
    container_resource.container_status = docker_container.attrs["State"]["Status"].lower()
    db.session.commit()
    return jsonify({})


@bp.route('/containers/<int:pk>/remove', methods=['post'])
def ctf_containers_remove(pk):
    """
        删除题目容器 如果容器不在线需要自己手动删除
        :param :container_resource 题目容器id
        :return
    """
    container = db.session.query(ContainerResource).get(pk)
    host = container.image.host
    try:
        client = docker.DockerClient(host.docker_api)
        docker_container = client.containers.get(container.container_id)
        docker_container.kill()
        docker_container.remove()
        db.session.delete(container)
        db.session.commit()
    except docker_error.DockerException as e:
        logger.exception(e)
        db.session.delete(container)
        db.session.commit()
        return make_response(jsonify({"msg": "容器不在线，请自行删除容器实例!"}), 200)
    return jsonify({"msg": "删除成功"})


@bp.route('/answers/status_list', methods=['get'])
def answer_status_list():
    """
        回答题目的类别
    """
    return jsonify({"data": list(Answer.status_choices)})


@bp.route('/images', methods=['get'])
def images_list():
    page = int(request.args.get('page', 1))
    page_size = int(request.args.get("page_size", 10))
    host_id = request.args.get('host')
    status = request.args.get('status')
    name = request.args.get('name')
    file = request.args.get('file')
    query = db.session.query(ImageResource)
    if host_id:
        query = query.filter(ImageResource.host_id == host_id)
    if status:
        query = query.filter(ImageResource.status == status)
    if name:
        query = query.filter(ImageResource.name.ilike('%%%s%%' % name))
    if file:
        query = query.filter(ImageResource.file.ilike('%' + file + '%|%'))
    page = query.order_by(ImageResource.id.desc()).paginate(page=page, per_page=page_size)
    data = []
    for item in page.items:
        _item = item.to_dict()
        _item["ip"] = item.host.ip
        _item["host_name"] = item.host.name
        data.append(_item)
    return success_api(data=data)


@bp.route('/images/<int:pk>', methods=['delete'])
def images_delete(pk):
    """
        删除镜像 目前仅仅删除数据库数据
    """
    instance = db.session.query(ImageResource).get(pk)
    db.session.delete(instance)
    db.session.commit()
    return success_api()


@bp.route('/images', methods=['post'])
def images_create():
    _data = request.get_json()
    name = _data.get("name")
    host_id = _data.get("host")
    version = _data.get("version")
    memory = _data.get("memory")
    cpu = _data.get("cpu")
    instance = ImageResource(
        host_id=host_id,
        name=name, version=version, memory=memory, cpu=cpu, file=_data["file"]
    )
    db.session.add(instance)
    db.session.commit()
    scheduler.add_job(f"build_question_tar_{instance.id}", build_question_tar, args=(instance.id,))
    return success_api()


@bp.route('/images/<int:pk>', methods=['put'])
def image_update(pk):
    _data = request.get_json()
    name = _data.get("name")
    host_id = _data.get("host_id")
    version = _data.get("version")
    memory = _data.get("memory")
    cpu = _data.get("cpu")
    instance = db.session.query(ImageResource).get(pk)
    instance.name = name
    instance.host_id = host_id
    instance.version = version
    instance.memory = memory
    instance.cpu = cpu
    instance.file = _data["file"]
    instance.status = ImageResource.STATUS_BUILDING
    db.session.commit()
    scheduler.add_job("test", build_question_tar, args=(instance.id,))
    return success_api()


@bp.route('/upload_docker_tar', methods=['post'])
def upload_docker_tar():
    pk = request.form.get("host")
    host_ = db.session.query(Host).get(pk)
    if not host_:
        return fail_api("请选择宿主机", status=400)
    docker_api = host_.docker_api
    # 测试连通性
    try:
        docker.DockerClient(docker_api, timeout=1)
    except docker.errors.DockerException:
        return fail_api(msg="Docker主机不在线", status=400)
    file = request.files["file"]
    filename = file.name
    base_dir = current_app.config.get("BASE_DIR")
    save_file_path = os.path.join(base_dir, 'upload', filename)
    file.save(save_file_path)
    build_question_tar.apply_async((save_file_path, docker_api))
    return success_api()
