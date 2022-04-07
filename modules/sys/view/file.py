import os
from flask import Blueprint, request, render_template, jsonify, current_app

from common.auth import auth
from common.constant import Status
from common.extend.orm import db
from common.model import and_
from common.request import req_safe_args, req_safe_json
from common.utils.uploads import get_uploader
from common.view import View, route
from modules.sys.models.dict import DictType, DictTypeOutSchema, DictData, DictDataSchema
from modules.sys.models.file import File, FileOutSchema

import os


class FileView(View):
    route_base = '/file'
    template_base = '/sys/file/'

    #  图片管理
    @route('/')
    @auth("admin:file:main")
    def index(self):
        return self.render('photo')

    #  图片数据
    @route('/table')
    @auth("admin:file:main")
    def table(self):
        data, total, page, limit = File.query.layui_paginate_json(FileOutSchema)
        return self.TableApi(data=data, count=total)

    #   上传
    @route('/upload')
    @auth("admin:file:add")
    def upload(self):
        return self.render('photo_add')

    #   上传接口
    @route('/upload', methods=['POST'])
    @auth("admin:file:add")
    def upload_api(self):
        if 'file' in request.files:
            file = request.files['file']
            mime = request.files['file'].content_type
            size = request.files['file'].content_length

            file_url = get_uploader().upload(filename=file.filename, file_obj=file.stream)

            db.session.add(
                File(
                    name=file.filename,
                    href='/static/upload/' + file_url,
                    mime=mime,
                    size=size
                )
            )
            db.session.commit()
            print(file_url)
            res = {
                "msg": "上传成功",
                "code": 0,
                "success": True,
                "data":
                    {"src": file_url}

            }
        return jsonify(res)

    @route('/delete', methods=['GET', 'POST'])
    # @authorize("admin:file:delete", log=True)
    def delete(self):
        _id = request.form.get('id')
        file = File.query.filter_by(id=_id).first()
        res = get_uploader().delete(filename=file.href.replace('/static/upload/',''))
        file.delete()
        if res:
            return self.success_api(msg="删除成功")
        else:
            return self.fail_api(msg="删除失败")

# return fail_api()
#
#
# #    图片删除
# @route('/delete', methods=['GET', 'POST'])
# @authorize("admin:file:delete", log=True)
# def delete():
#     _id = request.form.get('id')
#     res = upload_curd.delete_photo_by_id(_id)
#     if res:
#         return success_api(msg="删除成功")
#     else:
#         return fail_api(msg="删除失败")
#
#
# # 图片批量删除
# @route('/batchRemove', methods=['GET', 'POST'])
# @authorize("admin:file:delete", log=True)
# def batch_remove():
#     ids = request.form.getlist('ids[]')
#     photo_name = Photo.query.filter(Photo.id.in_(ids)).all()
#     upload_url = current_app.config.get("UPLOADED_PHOTOS_DEST")
#     for p in photo_name:
#         os.remove(upload_url + '/' + p.name)
#     photo = Photo.query.filter(Photo.id.in_(ids)).delete(synchronize_session=False)
#     db.session.commit()
#     if photo:
#         return success_api(msg="删除成功")
#     else:
#         return fail_api(msg="删除失败")
