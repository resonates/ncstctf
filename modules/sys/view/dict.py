from flask import request, jsonify

from common.constant import Status
from common.extend.orm import db
from common.model import and_
from common.request import req_safe_args, req_safe_json
from common.view import View, route
from modules.sys.models.dict import DictType, DictTypeOutSchema, DictData, DictDataSchema


class DictView(View):
    route_base = '/dict'
    template_base = '/sys/dict/'

    # 数据字典
    @route('/')
    # @authorize("admin:dict:main", log=True)
    def main(self):
        return self.render('main')

    @route('/dictType/data')
    # @authorize("admin:dict:main", log=True)
    def dict_type_data(self):
        filters = []
        type_name = req_safe_args('typeName')
        if type_name:
            filters.append(DictType.type_name.contains(type_name))
        data, total, page, limit = DictType.query.filter(
            and_(*filters)
        ).layui_paginate_json(DictTypeOutSchema)
        return self.TableApi(data=data, count=total)

    @route('/dictType/add')
    # @authorize("admin:dict:add", log=True)
    def dict_type_add(self):
        return self.render('add')

    @route('/dictType/save', methods=['post'])
    # @authorize("admin:dict:add", log=True)
    def dict_type_save(self):

        d = DictType(
            type_name=req_safe_json("typeName"),
            type_code=req_safe_json("typeCode"),
            enable=req_safe_json("enable"),
            description=req_safe_json('description')
        )

        if d.id is None:
            return self.fail_api(msg="增加失败")
        db.session.add(d)
        db.session.commit()
        return self.success_api(msg="增加成功")

    #  编辑字典类型
    @route('/dictType/edit')
    # @authorize("admin:dict:edit", log=True)
    def dict_type_edit(self):

        return self.render(
            'edit',
            dict_type=DictType.query.filter_by(
                id=request.args.get('dictTypeId', type=int)
            ).first()
        )

    #  编辑字典类型
    @route('/dictType/update', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_type_update(self):

        DictType.query.filter_by(
            id=req_safe_json("id")
        ).update({
            "description": req_safe_json("description"),
            "enable": req_safe_json("enable"),
            "type_code": req_safe_json("typeCode"),
            "type_name": req_safe_json("typeName")
        })
        db.session.commit()
        return self.success_api(msg="更新成功")

    # 启用字典
    @route('/dictType/enable', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_type_enable(self):
        if request.json.get('id'):
            if DictType.query.filter_by(id=request.json.get('id')).update({"enable": Status.enable}):
                db.session.commit()
                return self.success_api(msg="启用成功")
            return self.fail_api(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 禁用字典
    @route('/dictType/disable', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_type_dis_enable(self):
        if request.json.get('id'):
            if DictType.query.filter_by(id=request.json.get('id')).update({"enable": Status.unable}):
                db.session.commit()
                return self.success_api(msg="启用成功")
            return self.fail_api(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 删除字典类型
    @route('/dictType/remove/<int:_id>', methods=['put'])
    # @authorize("admin:dict:remove", log=True)
    def dict_type_delete(self, _id):
        res = DictType.query.filter_by(id=_id).delete()
        if not res:
            return self.fail_api(msg="删除失败")
        db.session.commit()
        return self.success_api(msg="删除成功")

    @route('/dictData/data')
    # @authorize("admin:dict:main", log=True)
    def dict_code_data(self):
        data, total, page, limit = DictData.query.filter_by(
            type_code=req_safe_args('typeCode')
        ).layui_paginate_json(DictDataSchema)
        return self.TableApi(data=data, count=total)

    # 增加字典数据
    @route('/dictData/add')
    # @authorize("admin:dict:add", log=True)
    def dict_data_add(self):
        return self.render(
            'data/add',
            type_code=request.args.get('typeCode', type=str)
        )

    # 增加字典数据
    @route('/dictData/save', methods=['post'])
    # @authorize("admin:dict:add", log=True)
    def dict_data_save(self):

        d = DictData(
            data_label=req_safe_json("dataLabel"),
            data_value=req_safe_json("dataValue"),
            enable=req_safe_json("enable"),
            remark=req_safe_json("remark"),
            type_code=req_safe_json("typeCode")
        )

        if not d.id:
            return jsonify(success=False, msg="增加失败")
        db.session.add(d)
        db.session.commit()
        return jsonify(success=True, msg="增加成功")

    #  编辑字典数据
    @route('/dictData/edit')
    # @authorize("admin:dict:edit", log=True)
    def dict_data_edit(self):
        return self.render(
            'data/edit',
            dict_data=DictData.query.filter_by(
                id=request.args.get('dataId', type=str)
            ).first()
        )

    #  编辑字典数据
    @route('/dictData/update', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_data_update(self):
        DictData.query.filter_by(
            id=request.json.get("dataId")
        ).update({
            "data_label": req_safe_json("dataLabel"),
            "data_value": req_safe_json("dataValue"),
            "enable": req_safe_json("enable"),
            "remark": req_safe_json("remark"),
            "type_code": req_safe_json("typeCode")
        })
        db.session.commit()
        return self.success_api(msg="更新成功")

    # 启用字典数据
    @route('/dictData/enable', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_data_enable(self):
        if request.json.get('dataId'):
            if DictData.query.filter_by(id=request.json.get('dataId')).update({"enable": Status.enable}):
                db.session.commit()
                return self.success_api(msg="启用成功")
            return self.fail_api(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 禁用字典数据
    @route('/dictData/disable', methods=['put'])
    # @authorize("admin:dict:edit", log=True)
    def dict_data_disenable(self):
        if request.json.get('dataId'):
            if DictData.query.filter_by(id=request.json.get('dataId')).update({"enable": Status.unable}):
                db.session.commit()
                return self.success_api(msg="禁用成功")
            return self.fail_api(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 删除字典类型
    @route('dictData/remove/<int:id>', methods=['delete'])
    # @authorize("admin:dict:remove", log=True)
    def dict_data_delete(self, _id):
        if not DictData.query.filter_by(id=_id).delete():
            return self.fail_api(msg="删除失败")
        db.session.commit()
        return self.success_api(msg="删除成功")
