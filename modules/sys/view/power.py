from flask import request, jsonify

from common.constant import Status
from common.extend.orm import db
from common.response import SuccessApi, FailApi
from common.validate import xss_escape
from common.view import View, route
from modules.sys.models.user_role_power import Power, PowerOutSchema2


class PowerView(View):
    route_base = '/power'
    template_base = '/sys/power/'

    @route('/')
    # @authorize("admin:power:main", log=True)
    def index(self):
        return self.render('main')

    @route('/data',methods=['post'])
    # @authorize("admin:power:main", log=True)
    def data(self):
        power = Power.query.all_json(PowerOutSchema2)
        print(power)
        res = {
            "code": 0,
            "data": power
        }
        return jsonify(res)

    @route('/add')
    # @authorize("admin:power:add", log=True)
    def add(self):
        return self.render('add')

    @route('/selectParent')
    # @authorize("admin:power:main", log=True)
    def select_parent(self):
        power = Power.query.all_json(PowerOutSchema2)
        power.append({"powerId": 0, "powerName": "顶级权限", "parentId": -1})
        res = {
            "status": {"code": 200, "message": "默认"},
            "data": power

        }
        return jsonify(res)

    # 增加
    @route('/save', methods=['post'])
    # @authorize("admin:power:add", log=True)
    def save(self):
        power = Power(
            icon=xss_escape(request.json.get("icon")),
            open_type=xss_escape(request.json.get("openType")),
            parent_id=xss_escape(request.json.get("parentId")),
            code=xss_escape(request.json.get("powerCode")),
            name=xss_escape(request.json.get("powerName")),
            type=xss_escape(request.json.get("powerType")),
            url=xss_escape(request.json.get("powerUrl")),
            sort=xss_escape(request.json.get("sort")),
            enable=1
        )
        print(power)
        r = db.session.add(power)
        db.session.commit()
        return self.success_api(msg="成功")

    # 权限编辑
    @route('/edit/<int:_id>')
    # @authorize("admin:power:edit", log=True)
    def edit(self, _id):
        power = Power.query.filter_by(id=_id).first()
        icon = str(power.icon).split()
        if len(icon) == 2:
            icon = icon[1]
        else:
            icon = None
        return self.render('edit', power=power, icon=icon)

    # 权限更新
    @route('/update', methods=['put'])
    # @authorize("admin:power:edit", log=True)
    def update(self):
        data = {
            "icon": xss_escape(request.json.get("icon")),
            "open_type": xss_escape(request.json.get("openType")),
            "parent_id": xss_escape(request.json.get("parentId")),
            "code": xss_escape(request.json.get("powerCode")),
            "name": xss_escape(request.json.get("powerName")),
            "type": xss_escape(request.json.get("powerType")),
            "url": xss_escape(request.json.get("powerUrl")),
            "sort": xss_escape(request.json.get("sort"))
        }
        res = Power.query.filter_by(id=request.json.get("powerId")).update(data)

        if not res:
            return self.fail_api(msg="更新权限失败")
        db.session.commit()
        return self.success_api(msg="更新权限成功")

    # 启用权限
    @route('/enable', methods=['put'])
    # @authorize("admin:power:edit", log=True)
    def enable(self):
        if request.json.get('powerId'):
            if Power.query.filter_by(id=request.json.get('roleId')).update({"enable": Status.enable}):
                db.session.commit()
                return SuccessApi(msg="禁用成功")
            return FailApi(msg="出错啦")

    # 禁用权限
    @route('/disable', methods=['put'])
    # @authorize("admin:power:edit", log=True)
    def dis_enable(self):
        if request.json.get('powerId'):
            if Power.query.filter_by(id=request.json.get('roleId')).update({"enable": Status.unable}):
                db.session.commit()
                return SuccessApi(msg="禁用成功")
            return FailApi(msg="出错啦")

    # 权限删除
    @route('/remove/<int:_id>', methods=['delete'])
    # @authorize("admin:power:remove", log=True)
    def remove(self, _id):
        power = Power.query.filter_by(id=_id).first()
        power.role = []

        r = Power.query.filter_by(id=_id).delete()
        db.session.commit()
        if r:
            return self.success_api(msg="删除成功")
        else:
            return self.fail_api(msg="删除失败")

    # 批量删除
    @route('/batchRemove')
    # @authorize("admin:power:remove", log=True)
    def batch_remove(self):
        ids = request.form.getlist('ids[]')
        for id in ids:
            power = Power.query.filter_by(id=id).first()
            power.role = []

            r = Power.query.filter_by(id=id).delete()
            if not r:
                return FailApi(msg="失败")
        db.session.commit()
        return SuccessApi(msg="批量删除成功")
