from flask import Blueprint, render_template, request
from flask_login import login_required, current_user
from sqlalchemy import desc

from applications.common import curd
from applications.common.curd import model_to_dicts, enable_status, disable_status
from applications.common.helper import ModelFilter
from applications.common.utils.http import table_api, fail_api, success_api
from applications.common.utils.rights import authorize
from applications.common.utils.validate import xss_escape
from applications.extensions import db
from applications.models import Role
from applications.models import Notice
from applications.models.notice import NoticeOutSchema
from applications.schemas import UserOutSchema

notice_bp = Blueprint('notice', __name__, url_prefix='/admin/notice')


@notice_bp.get('/')
def main():
    return render_template('admin/notice/main.html')


@notice_bp.get('/data')
def data():
    data, total, page, limit = Notice.query.layui_paginate_json(NoticeOutSchema)
    return table_api(data=data, count=total, limit=limit)


@notice_bp.get('/add')
def add():
    return render_template('admin/notice/add.html')


@notice_bp.post('/add')
def add_post():
    print(request.json)
    db.session.add(
        Notice(content=request.json.get("content"))
    )
    db.session.commit()
    return success_api()


@notice_bp.put('/enable')
def enable():
    print(request.json)
    _id = request.json.get('id')
    if _id:
        enable = 1
        role = Notice.query.filter_by(id=_id).update({"active": enable})
        if role:
            db.session.commit()
            return success_api(msg="启动成功")
        return fail_api(msg="出错啦")
    return fail_api(msg="数据错误")


@notice_bp.put('/disable')
def dis_enable():
    _id = request.json.get('id')
    if _id:
        disenable = 0
        role = Notice.query.filter_by(id=_id).update({"active": disenable})
        if role:
            db.session.commit()
            return success_api(msg="启动成功")
        return fail_api(msg="出错啦")
    return fail_api(msg="数据错误")
