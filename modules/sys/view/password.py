from io import BytesIO

from flask import render_template, session, make_response, request, redirect
from flask_login import login_user, logout_user

from common.auth import current_user
from common.response import FailApi, SuccessApi
from common.utils.captcha import vieCode
from common.view import View, route, url_for
from modules.sys.models.user_role_power import User


class PasswordView(View):
    route_base = '/password'
    template_base = '/'

    @route('/getCaptcha')
    # 获取验证码
    def get_captcha(self):
        image, code = vieCode().GetCodeImage()
        out = BytesIO()
        code = (''.join(code)).lower()
        session["code"] = code
        image.save(out, 'png')
        out.seek(0)
        resp = make_response(out.read())
        resp.content_type = 'image/png'
        return resp

    # 登录
    @route('/login')
    def login(self):
        if current_user.is_authenticated:
            return redirect(url_for('sys.index'))
        return render_template('sys/login.html')

    # 登录
    @route('/login', methods=['post'])
    def login_post(self):
        req = request.form
        username = req.get('username')
        password = req.get('password')
        code = req.get('captcha').__str__().lower()

        if not username or not password or not code:
            return self.fail_api(msg="用户名或密码没有输入")
        s_code = session.get("code", None)
        session["code"] = None

        if not all([code, s_code]):
            return self.fail_api(msg="参数错误")

        if code != s_code:
            return self.fail_api(msg="验证码错误")
        user = User.query.filter_by(username=username).first()

        if not user:
            return self.fail_api(msg="不存在的用户")

        if user.enable == 0:
            return self.fail_api(msg="用户被暂停使用")

        if username == user.username and user.validate_password(password):
            # 登录
            login_user(user)
            # 记录登录日志
            # login_log(request, uid=user.id, is_access=True)
            # 存入权限
            role = current_user.role
            user_power = []
            for i in role:
                if i.enable == 0:
                    continue
                for p in i.power:
                    if p.enable == 0:
                        continue
                    user_power.append(p.code)
            session['permissions'] = user_power

            return self.success_api(msg="登录成功")
        # login_log(request, uid=user.id, is_access=False)
        return self.fail_api(msg="用户名或密码错误")

    # 退出登录
    # @route('/logout', methods=['post'])
    # @login_required
    def logout(self):
        logout_user()
        session.pop('permissions')
        return FailApi(msg="注销成功")
