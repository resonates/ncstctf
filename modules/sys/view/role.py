from flask import request, jsonify
from flask_login import login_required

from common.constant import Status
from common.extend.orm import db
from common.model import and_
from common.request import req_safe_args, req_safe_json
from common.response import SuccessApi, FailApi
from common.view import View, route
from modules.sys.models.user_role_power import Role, RoleOutSchema, Power, PowerOutSchema


class RoleView(View):
    route_base = '/role'
    template_base = '/sys/role/'

    @route('/')
    # @authorize("admin:role:main", log=True)
    def main(self):
        """
        用户管理
        """
        return self.render('main')

    @route('/data')
    # @authorize("admin:role:main", log=True)
    def table(self):
        """
        表格数据
        """
        filters = []
        name = req_safe_args('roleName')
        if name:
            filters.append(Role.name.contains(name))
        code = req_safe_args('roleCode')
        if code:
            filters.append(Role.code.contains(code))

        data, total, page, limit = Role.query.filter(
            and_(*filters)
        ).layui_paginate_json(schema=RoleOutSchema)
        # 返回api
        return self.TableApi(data=data, count=total, limit=limit)

    @route('/add')
    # @authorize("admin:role:add", log=True)
    def add(self):
        """
        角色增加
        """
        return self.render('add')

    @route('/save', methods=['post'])
    # @authorize("admin:role:add", log=True)
    def save(self):
        """
        角色增加
        """
        role = Role(
            details=req_safe_json("details"),
            enable=req_safe_json("enable"),
            code=req_safe_json("roleCode"),
            name=req_safe_json("roleName"),
            sort=req_safe_json("sort")
        )
        db.session.add(role)
        db.session.commit()
        return self.success_api(msg="成功")

    @route('/power/<int:_id>')
    # @authorize("admin:role:power", log=True)
    def power(self, _id):
        """
        角色授权
        """
        return self.render('power', id=_id)

    @route('/getRolePower/<int:id>')
    # @authorize("admin:role:main", log=True)
    def get_role_power(self, _id):
        """
        获取角色权限
        """
        role = Role.query.filter_by(id=_id).first()
        check_powers = role.power
        check_powers_list = []
        for cp in check_powers:
            check_powers_list.append(cp.id)
        powers = Power.query.all()
        power_schema = PowerOutSchema(many=True)  # 用已继承ma.ModelSchema类的自定制类生成序列化类
        output = power_schema.dump(powers)  # 生成可序列化对象
        for i in output:
            if int(i.get("powerId")) in check_powers_list:
                i["checkArr"] = "1"
            else:
                i["checkArr"] = "0"
        res = {
            "data": output,
            "status": {"code": 200, "message": "默认"}
        }
        return jsonify(res)

    # 保存角色权限
    @route('/saveRolePower', methods=['put'])
    # @authorize("admin:role:edit", log=True)
    def save_role_power(self):
        req_form = request.form
        power_ids = req_form.get("powerIds")
        power_list = power_ids.split(',')
        role_id = req_form.get("roleId")
        role = Role.query.filter_by(id=role_id).first()

        powers = Power.query.filter(Power.id.in_(power_list)).all()
        role.power = powers

        db.session.commit()
        return SuccessApi(msg="授权成功")

    @route('/edit/<int:id>')
    # @authorize("admin:role:edit", log=True)
    def edit(self, _id):
        """
        角色编辑
        """
        return self.render(
            'edit',
            role=Role.query.filter_by(id=_id).first()
        )

    # 更新角色
    @route('/update', methods=['put'])
    # @authorize("admin:role:edit", log=True)
    def update(self):
        if not request.json.get("roleId"):
            return FailApi(msg="参数错误")

        role = Role.query.filter_by(id=id).update({
            "code": req_safe_json("roleCode"),
            "name": req_safe_json("roleName"),
            "sort": req_safe_json("sort"),
            "enable": req_safe_json("enable"),
            "details": req_safe_json("details")
        })
        if not role:
            return FailApi(msg="更新角色失败")

        db.session.commit()
        return SuccessApi(msg="更新角色成功")

    # 启用用户
    @route('/enable', methods=['put'])
    # @authorize("admin:role:edit", log=True)
    def enable(self):
        if request.json.get('roleId'):
            if Role.query.filter_by(id=request.json.get('roleId')).update({"enable": Status.enable}):
                db.session.commit()
                return SuccessApi(msg="启用成功")
            return FailApi(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 禁用用户
    @route('/disable', methods=['put'])
    # @authorize("admin:role:edit", log=True)
    def dis_enable(self):
        if request.json.get('roleId'):
            if Role.query.filter_by(id=request.json.get('roleId')).update({"enable": Status.unable}):
                db.session.commit()
                return SuccessApi(msg="禁用成功")
            return FailApi(msg="出错啦")
        else:
            return self.fail_api("数据错误")

    # 角色删除
    @route('/remove/<int:id>', methods=['delete'])
    # @authorize("admin:role:remove", log=True)
    def remove(self, _id):
        role = Role.query.filter_by(id=_id).first()

        # 删除该角色的权限和用户
        role.power = []
        role.user = []

        r = Role.query.filter_by(id=_id).delete()

        if not r:
            return FailApi(msg="角色删除失败")
        db.session.commit()
        return SuccessApi(msg="角色删除成功")

    # 批量删除
    @route('/batchRemove', methods=['delete'])
    # @authorize("admin:role:remove", log=True)
    @login_required
    def batch_remove(self):
        for _id in request.form.getlist('ids[]'):
            role = Role.query.filter_by(id=_id).first()
            # 删除该角色的权限和用户
            role.power = []
            role.user = []

            r = Role.query.filter_by(id=id).delete()
            if not r:
                return FailApi(msg="角色删除失败")
        db.session.commit()
        return SuccessApi(msg="批量删除成功")
