from flask import request, jsonify
from flask_login import login_required

from common.constant import Status
from common.extend.orm import db
from common.model import and_
from common.request import req_safe_args, req_safe_json
from common.response import SuccessApi, FailApi
from common.view import View, route
from modules.sys.models.user_role_power import Role, RoleOutSchema, Power, PowerOutSchema


class SubjectView(View):
    route_base = '/subject'
    template_base = '/sys/subject/'

    @route('/')
    # @authorize("admin:role:main", log=True)
    def main(self):
        """
        题目管理
        """
        return self.render('main')