import os
from datetime import datetime

import docker
import requests
from docker import errors as docker_error
from flask import Blueprint, jsonify, request, render_template

from applications.common.utils.http import fail_api, success_api, table_api
from applications.extensions import db
# from app.lib.exceptions import make_error_response
# from app.models.admin import TaskList
from applications.models.docker import Host

# from app.tasks import task_docker

docker_bp = Blueprint("admin_docker", __name__, url_prefix="/docker")


def fetch_system_info_by_docker_api(docker_api):
    try:
        client = docker.DockerClient(docker_api, timeout=1)
    except docker.errors.DockerException:
        return {}
    info = client.info()
    os = info["OperatingSystem"]
    info = client.info()
    data = {
        "os": os,
        "cpu": info["NCPU"],
        "memory": round(info["MemTotal"] / 1024 / 1024 / 1024, 2)
    }
    return data


@docker_bp.route('/')
def host():
    return render_template('admin/docker/main.html')


@docker_bp.route('/data', methods=['get'])
def host_list():
    """
        主机列表
    :param
    :return
    """
    page = int(request.args.get('page', 1))
    page_size = int(request.args.get("page_size", 10))
    search = request.args.get("search")
    query = db.session.query(Host)
    if search:
        query = query.filter(Host.name.contains("%" + search + "%") | Host.ip.contains("%" + search + "%"))
    page = query.paginate(page=page, per_page=page_size)
    data = []
    for item in page.items:
        data.append({
            "id": item.id,
            "name": item.name,
            "docker_api": item.docker_api,
            "ip": item.ip,
            "remark": item.remark,
            "active": item.active,
            "system": item.system,
            "create_time": item.create_time,
            "online_time": item.online_time.strftime("%Y-%m-%d %H:%M") if item.online_time else None,
            "is_online": bool(item.online_time and (datetime.now() - item.online_time).total_seconds() < 60 * 10)
        })
    return jsonify({
        "total": page.total,
        "data": data,
        "code": 0
    })


@docker_bp.route('/add')
def host_add():
    """
        添加docker主机
    :return:
    """
    return render_template('admin/docker/add.html')


@docker_bp.route('/host', methods=['post'])
def host_crate():
    """
        添加docker主机
    :return:
    """
    data = request.get_json()
    name = data.get("name", "").strip()
    docker_api = data.get("docker_api", "").strip()
    ip = data.get("ip", "").strip()
    active = bool(data.get("active"))
    remark = data.get("remark")
    # 判断重复
    if not name:
        return fail_api("主机名不允许为空！")
    if db.session.query(Host).filter(Host.name == name).all():
        return fail_api("该主机名称已存在")
    if not docker_api:
        return fail_api("主机地址不允许为空！")
    if not ip:
        return fail_api("IP不允许为空！")
    # 测试主机连通性
    try:
        system = fetch_system_info_by_docker_api(docker_api)
    except requests.exceptions.ConnectionError:
        return fail_api("该主机不在线")
    db.session.add(Host(name=name, docker_api=docker_api, active=active, remark=remark, ip=ip, system=system))
    db.session.commit()
    return success_api("成功")


@docker_bp.route('/edit/<int:host>')
def host_edit_tem(host):
    """
        修改docker主机
    :return:
    """
    instance = db.session.query(Host).get(host)
    return render_template('admin/docker/edit.html', instance=instance)


@docker_bp.route('/host/edit/<int:host>', methods=['post'])
def host_edit(host):
    """
    编辑主机
    :param :host :主机ID
    :return
    """
    data = request.get_json()
    name = data.get("name", "").strip()
    docker_api = data.get("docker_api", "").strip()
    ip = data.get("ip", "").strip()
    active = bool(data.get("active"))
    remark = data.get("remark")
    Host.query.filter_by(id=host).update(
        {'name': name, 'docker_api': docker_api, 'active': active, 'remark': remark, 'ip': ip,
         })

    db.session.commit()
    return success_api("成功")


@docker_bp.route('/host/<int:host>', methods=['delete'])
def host_delete(host):
    """
    删除主机
    :param :host :主机ID
    :return
    """
    instance = db.session.query(Host).get(host)
    db.session.delete(instance)
    db.session.commit()
    return success_api("成功")


@docker_bp.route('/host/<int:host>', methods=['put'])
def host_update(host):
    """
        添加docker主机
    :return:
    """
    data = request.get_json()
    name = data.get("name", "").strip()
    ip = data.get("ip")
    remark = data.get("remark")
    active = data.get("active")
    docker_api = data.get("docker_api")
    instance = db.session.query(Host).filter(Host.id == host).first()
    if not instance:
        return fail_api("资源不存在！")
    if not name:
        return fail_api("主机名不允许为空！")
    if active is not None:
        instance.active = active
    if db.session.query(Host).filter(Host.name == name, Host.id != host).all():
        return fail_api("该主机名称已存在！")
    system_info = fetch_system_info_by_docker_api(docker_api)
    instance.docker_api = docker_api
    instance.name = name
    instance.ip = ip
    instance.remark = remark
    instance.system = system_info
    if system_info:
        instance.online_time = datetime.now()
    db.session.commit()
    return jsonify({"status": "ok"})


# @docker_bp.route('/detail/api/<int:pk>', methods=['get'])
# def host_detail_api(pk):
#     """主机详情
#     :data id: 主机ID
#     :return
#     """
#     instance = db.session.query(Host).filter(Host.id == pk).one_or_none()
#     try:
#         client = docker.DockerClient(instance.docker_api)
#         info = client.info()
#     except docker_error.DockerException:
#         info = {}
#     if info:
#         """数据格式化"""
#         info = {
#             "containers": info["Containers"],
#             "images": info["Images"],
#             "version": info["KernelVersion"],
#             "memory": round(info["MemTotal"] / 1024 / 2024 / 1024, 2),
#             "cpu": info["NCPU"],
#             "system": info["OperatingSystem"],
#             "system_time": info["SystemTime"]
#
#         }
#     data = {
#         "id": instance.id,
#         "name": instance.name,
#         "docker_api": instance.docker_api,
#         "remark": instance.remark,
#         "ip": instance.ip,
#         "info": info
#     }
#     return jsonify({"data": data})
#

@docker_bp.route('/detail/<int:pk>', methods=['get'])
def host_detail(pk):
    """主机详情
    :data id: 主机ID
    :return
    """
    instance = db.session.query(Host).filter(Host.id == pk).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        info = client.info()
    except docker_error.DockerException:
        info = {}
    if info:
        """数据格式化"""
        info = {
            "containers": info["Containers"],
            "images": info["Images"],
            "version": info["KernelVersion"],
            "memory": round(info["MemTotal"] / 1024 / 2024 / 1024, 2),
            "cpu": info["NCPU"],
            "system": info["OperatingSystem"],
            "system_time": info["SystemTime"]

        }
    data = {
        "id": instance.id,
        "name": instance.name,
        "docker_api": instance.docker_api,
        "remark": instance.remark,
        "ip": instance.ip,
        "info": info
    }
    return render_template('admin/docker/detail.html', data=data)


@docker_bp.route('/host/<int:host>/images', methods=['get'])
def host_images(host):
    instance = db.session.query(Host).filter(Host.id == host).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        images = client.images.list()
    except docker_error.DockerException:
        images = []
    images_list = []
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
        images_list.append(tmp)
    data = {
        "id": instance.id,
        "name": instance.name,
        "docker_api": instance.docker_api,
        "remark": instance.remark,
        "images": images_list
    }
    return render_template('admin/docker/images/main.html', data=data, host=host)


@docker_bp.route('/host/<int:host>/images/data')
def host_images_data(host):
    instance = db.session.query(Host).filter(Host.id == host).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        images = client.images.list()
    except docker_error.DockerException:
        images = []
    images_list = []
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
        images_list.append(tmp)
    return table_api(data=images_list)


@docker_bp.route('/images', methods=['delete'])
def image_delete():
    tag = request.get_json().get('id')
    host = request.get_json().get("host")
    instance = db.session.query(Host).filter(Host.id == host).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        print(client)
        res = client.images.remove(tag)
    except docker_error.DockerException as e:
        error_str = str(e)
        if "is using its referenced image" in error_str or "image is being used by stopped container" in error_str:
            return fail_api("当前镜像被占用，请先删除对应容器！")
        if "is being used by running container" in error_str:
            return fail_api("当前有对应容器正在运行，请停止对应容器！")
        if "image is referenced in multiple repositories" in error_str:
            return fail_api("镜像被多个仓库依赖！")
        print(e)
        return fail_api("删除失败")
    return success_api()


@docker_bp.route('/containers/<int:pk>', methods=['get'])
def host_docker_container(pk):
    """
        获取容器列表
    :return:
    """
    instance = db.session.query(Host).filter(Host.id == pk).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        containers = client.containers.list(all=True)
    except docker_error.DockerException:
        containers = []
    containers = [container.attrs for container in containers]
    data = {
        "id": instance.id,
        "name": instance.name,
        "docker_api": instance.docker_api,
        "remark": instance.remark,
        "containers": containers
    }
    return render_template('admin/docker/container/main.html', data=data,pk=pk)


@docker_bp.route('/containers/data/<int:pk>', methods=['get'])
def host_docker_container_data(pk):
    """
        获取容器列表
    :return:
    """
    instance = db.session.query(Host).filter(Host.id == pk).one_or_none()
    try:
        client = docker.DockerClient(instance.docker_api)
        containers = client.containers.list(all=True)
    except docker_error.DockerException:
        containers = []
    containers = [container.attrs for container in containers]
    return table_api(data=containers)

# @docker_bp.route('/host/<int:host>/images', methods=['get'])
# def host_images(host):
#     """
#         获取镜像列表
#     :param host: 主机ID
#     :return:
#     """
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient(instance.docker_api)
#         images = client.images.list()
#     except docker_error.DockerException:
#         images = []
#     images_list = []
#     for im in images:
#         attrs = im.attrs
#         if not attrs["RepoTags"]:
#             continue
#         tmp = {
#             "created": attrs["Created"].split("T")[0],
#             "id": attrs["Id"][7:17],
#             "size": attrs["Size"],
#             "repo": attrs["RepoTags"][0].split(":")[0],
#             "tags": [i.split(":")[1] for i in attrs["RepoTags"]]
#         }
#         images_list.append(tmp)
#     data = {
#         "id": instance.id,
#         "name": instance.name,
#         "docker_api": instance.docker_api,
#         "remark": instance.remark,
#         "images": images_list
#     }
#     return jsonify({"data": data})

#
# @docker_bp.route('/images', methods=['delete'])
# def image_delete():
#     tag = request.get_json().get('id')
#     host = request.get_json().get("host")
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient("http://{}".format(instance.addr))
#         res = client.images.remove(tag)
#     except docker_error.DockerException as e:
#         error_str = str(e)
#         if "is using its referenced image" in error_str:
#             return fail_api("当前镜像被占用，请先删除对应容器！")
#         if "is being used by running container" in error_str:
#             return fail_api("当前有对应容器正在运行，请停止对应容器！")
#         if "image is referenced in multiple repositories" in error_str:
#             return fail_api("镜像被多个仓库依赖！")
#         return fail_api("删除失败")
#     return jsonify({"status": 0})
#
#
# @docker_bp.route('/containers', methods=['get'])
# def host_docker_container():
#     """
#         获取列表
#     :return:
#     """
#     pk = request.args.get("id")
#     instance = db.session.query(Host).filter(Host.id == pk).one_or_none()
#     try:
#         client = docker.DockerClient(instance.docker_api)
#         containers = client.containers.list(all=True)
#     except docker_error.DockerException:
#         containers = []
#     containers = [container.attrs for container in containers]
#     data = {
#         "id": instance.id,
#         "name": instance.name,
#         "docker_api": instance.docker_api,
#         "remark": instance.remark,
#         "containers": containers
#     }
#     return jsonify({"data": data})
#
#
# @docker_bp.route('/containerStop', methods=['post'])
# def container_stop():
#     """
#         关闭容器
#     :return:
#     """
#     host = request.get_json().get("host")
#     container_id = request.get_json().get("id")
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient("http://{}".format(instance.addr))
#         container = client.containers.get(container_id)
#         container.stop()
#     except docker_error.DockerException:
#         return fail_api(f'关闭容器失败:{container_id}')
#     return jsonify({"status": 'ok'})
#
#
# @docker_bp.route('/containerStart', methods=['post'])
# def container_start():
#     """
#         关闭容器
#     :return:
#     """
#     host = request.get_json().get("host")
#     container_id = request.get_json().get("id")
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient("http://{}".format(instance.addr))
#         container = client.containers.get(container_id)
#         res = container.start()
#     except docker_error.DockerException:
#         return fail_api('关闭容器失败:{container_id}')
#     return jsonify({"status": 'ok'})
#
#
# @docker_bp.route('/containerAction', methods=['post'])
# def container_action():
#     """
#         容器操作
#     :return:
#     """
#     host = request.get_json().get("host")
#     container_id = request.get_json().get("id")
#     action = request.get_json().get("action")
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient("http://{}".format(instance.addr))
#         container = client.containers.get(container_id)
#         action_fun = getattr(container, action)
#         action_fun()
#     except docker_error.DockerException as e:
#         return fail_api('关闭容器失败:{container_id}')
#     return jsonify({"status": 'ok'})
#
#
# @docker_bp.route('/host/<int:host>/image/<image>', methods=['get'])
# def image_detail(host, image):
#     """
#         镜像详情
#     :param host: 主机
#     :param image: 镜像ID
#     :return:
#     """
#
#     instance = db.session.query(Host).filter(Host.id == host).one_or_none()
#     try:
#         client = docker.DockerClient("http://{}".format(instance.addr))
#         image = client.images.get(image).attrs
#     except docker_error.DockerException as e:
#         image = {}
#     data = {
#         "id": instance.id,
#         "name": instance.name,
#         "url": instance.addr,
#         "remark": instance.remark,
#         "image": image
#     }
#     return jsonify({"results": data})
#
# #
# # @docker_bp.route('/host/<int:host>/image', methods=['post'])
# # def image_create(host):
# #     """
# #         编译是一个比较耗时的任务 这里回采取延迟执行方式
# #     """
# #     build_type = request.args.get('build_type')
# #     task = TaskList(admin_id=g.user.id, target_id=host, title="build image for %s" % build_type)
# #     db.session.add(task)
# #     db.session.commit()
# #     tag = request.args.get('tag')
# #     if len(tag.split(":")) != 2:
# #         return make_error_response("images name 格式错误请指定tag")
# #     args = (task.id, host, build_type, tag, g.user.id)
# #     if build_type == 'tar':
# #         file = request.files.get('files')
# #         pt = os.path.join('upload', file.filename)
# #         file.save(pt)
# #         kwargs = {"pt": pt}
# #     elif build_type == 'dockerfile':
# #         kwargs = {"dockerfile": request.get_json().get("dockerfile")}
# #     else:
# #         kwargs = {}
# #     task_docker.build_delay.apply_async(args=args, kwargs=kwargs)
# #     return jsonify({"status": 'ok', 'data': {"task": task.id}})
