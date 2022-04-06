from flask import request
from pydantic import BaseModel, validator

from common.auth import auth, current_user, login_required
from common.extend.orm import db
from common.model import and_
from common.validate import validate
from common.view import View, route, url_for
from common.request import req_safe_args, req_safe_json
from modules.sys.models.dept import Dept
from modules.sys.models.user_role_power import User, Role, UserOutSchema


#
# class UserArge(BaseModel):
#     name: str
#
#     @validator('name')
#     def name_must_contain_space(cls, v):
#         if v is None:
#             return None
#         else:
#             return v.replace("&", "&amp;").replace(">", "&gt;").replace("<", "&lt;").replace("'", "&#39;").replace('"',
#                                                                                                                    "&#34;")
#

class UserView(View):
    route_base = '/user'
    template_base = '/sys/user/'

    # @route('/')
    # def index(self):
    #     res = db.session.query(User.id, User.username, Role.name).all()
    #     data = self.serialize(res)
    #     return self.api_data(data)
    #
    # def testm(self):
    #     res = User.query.all(UserOutSchema)
    #     return self.api_data(res)
    #
    # @route('/test')
    # def test(self):
    #     return url_for("sys.UserView:index")
    #
    # @route('/render')
    # def rendera(self):
    #     return self.render('test')
    #
    # @route('/arge', methods=['POST'])
    # @validate()
    # def arge(self, body: UserArge):
    #     return body.name

    # 用户管理
    @route('/')
    # @auth("admin:user:main")
    def main(self):
        return self.render('main')

    #   用户分页查询
    @route('/data')
    # @auth("admin:user:main")
    def data(self):
        filters = []
        real_name = req_safe_args('realName')
        if real_name:
            filters.append(User.realname.contains(real_name))
        username = req_safe_args('username')
        if username:
            filters.append(User.username.contains(username))
        dept_id = request.args.get('deptId', type=int)
        if dept_id:
            filters.append(dept_id)

        # orm查询
        # 使用分页获取data需要.items

        data, total = db.session.query(
            User.id,
            User.username,
            Dept.dept_name
        ).filter(
            User.dept_id == Dept.id
        ).layui_paginate_db_json()
        # 返回api
        return self.TableApi(data=data, count=total)

    # 用户增加
    @route('/add')
    # @auth("admin:user:add")
    def add(self):
        return self.render(
            'add',
            roles=Role.query.all()
        )

    @route('/save', methods=['post'])
    # @auth("admin:user:add")
    def save(self):
        a = request.json.get("roleIds")
        username = req_safe_json('username')
        real_name = req_safe_json('realName')
        password = req_safe_json('password')
        role_ids = a.split(',')

        if not username or not real_name or not password:
            return self.fail_api(msg="账号姓名密码不得为空")

        if bool(User.query.filter_by(username=username).count()):
            return self.fail_api(msg="用户已经存在")
        user = User(username=username, realname=real_name)
        user.set_password(password)
        db.session.add(user)
        roles = Role.query.filter(Role.id.in_(role_ids)).all()
        for r in roles:
            user.role.append(r)
        db.session.commit()
        return self.success_api(msg="增加成功")

    # 删除用户
    @route('/remove/<int:id>', methods=['delete'])
    # @auth("admin:user:remove")
    def delete(self, _id):
        user = User.query.filter_by(id=_id).first()
        user.role = []

        res = User.query.filter_by(id=_id).delete()

        if not res:
            return self.fail_api(msg="删除失败")
        db.session.commit()
        return self.success_api(msg="删除成功")

    #  编辑用户
    @route('/edit/<int:id>')
    # @auth("admin:user:edit")
    def edit(self, _id):
        user = User.query.filter_by(id=_id).first()
        roles = Role.query.all()
        checked_roles = []
        for r in user.role:
            checked_roles.append(r.id)
        return self.render('edit', user=user, roles=roles, checked_roles=checked_roles)

    #  编辑用户
    @route('/update', methods=['put'])
    # @auth("admin:user:edit")
    def update(self):
        a = req_safe_json("roleIds")
        id = req_safe_json("userId")
        username = req_safe_json('username')
        real_name = req_safe_json('realName')
        dept_id = req_safe_json('deptId')
        role_ids = a.split(',')
        User.query.filter_by(id=id).update({'username': username, 'realname': real_name, 'dept_id': dept_id})
        u = User.query.filter_by(id=id).first()

        roles = Role.query.filter(Role.id.in_(role_ids)).all()
        u.role = roles

        db.session.commit()
        return self.success_api(msg="更新成功")

    # 个人中心
    @route('/center')
    # @login_required
    def center(self):
        user_info = current_user
        user_logs = AdminLog.query.filter_by(url='/passport/login').filter_by(uid=current_user.id).order_by(
            desc(AdminLog.create_time)).limit(10)
        return render_template('admin/user/center.html', user_info=user_info, user_logs=user_logs)

    # 修改头像
    @route('/profile')
    # @login_required
    def profile(self):
        return self.render('admin/user/profile.html')

    # 修改头像
    @route('/updateAvatar', methods=['put'])
    # @login_required
    def update_avatar(self):
        url = request.json.get("avatar").get("src")
        r = User.query.filter_by(id=current_user.id).update({"avatar": url})

        if not r:
            return self.fail_api(msg="出错啦")
        db.session.commit()
        return self.success_api(msg="修改成功")

    # 修改当前用户信息
    @route('/updateInfo', methods=['put'])
    # @login_required
    def update_info(self):
        req_json = request.json
        r = User.query.filter_by(id=current_user.id).update(
            {"realname": req_json.get("realName"), "remark": req_json.get("details")})

        if not r:
            return self.fail_api(msg="出错啦")
        db.session.commit()
        return self.success_api(msg="更新成功")

    # 修改当前用户密码
    @route('/editPassword')
    # @login_required
    def edit_password(self):
        return self.render('edit_password')

    # 修改当前用户密码
    @route('/editPassword', methods=['put'])
    # @login_required
    def edit_password_put(self):
        res_json = request.json
        if res_json.get("newPassword") == '':
            return self.fail_api("新密码不得为空")
        if res_json.get("newPassword") != res_json.get("confirmPassword"):
            return self.fail_api("俩次密码不一样")
        user = current_user
        is_right = user.validate_password(res_json.get("oldPassword"))
        if not is_right:
            return self.fail_api("旧密码错误")
        user.set_password(res_json.get("newPassword"))
        db.session.add(user)
        db.session.commit()
        return self.success_api("更改成功")

    # 启用用户
    @route('/enable', methods=['put'])
    # @auth("admin:user:edit")
    def enable(self):
        _id = request.json.get('userId')
        if _id:
            res = enable_status(model=User, id=_id)
            if not res:
                return fail_api(msg="出错啦")
            return success_api(msg="启动成功")
        return fail_api(msg="数据错误")

    # 禁用用户
    @route('/disable', methods=['put'])
    # @auth("admin:user:edit")
    def dis_enable(self):
        _id = request.json.get('userId')
        if _id:
            res = disable_status(model=User, id=_id)
            if not res:
                return fail_api(msg="出错啦")
            return success_api(msg="禁用成功")
        return fail_api(msg="数据错误")

    # 批量删除
    @route('/batchRemove', methods=['delete'])
    # @auth("admin:user:remove")
    def batch_remove(self):
        ids = request.form.getlist('ids[]')
        for id in ids:
            user = User.query.filter_by(id=id).first()
            user.role = []

            res = User.query.filter_by(id=id).delete()
            db.session.commit()
        return self.success_api(msg="批量删除成功")
