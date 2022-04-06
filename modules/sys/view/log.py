from sqlalchemy import desc

from common.response import TableApi
from common.view import View, route
from modules.sys.models.logging import Logging, LoggingOutSchema


class LogView(View):
    route_base = '/log'
    template_base = '/sys/log/'

    @route('/')
    # @authorize("admin:log:main")
    def index(self):
        """
        日志管理
        """
        return self.render('main')

    @route('/loginLog')
    # @authorize("admin:log:main")
    def login_log(self):
        """
        登录日志
        """
        data, total = Logging.query.filter_by(
            url='/passport/login'
        ).order_by(
            desc(Logging.create_time)
        ).layui_paginate(schema=LoggingOutSchema)
        return TableApi(data=data, count=total)

    @route('/operateLog')
    # @authorize("admin:log:main")
    def operate_log(self):
        """
        操作日志
        """
        data, total = Logging.query.filter(
            Logging.url != '/passport/login'
        ).order_by(
            desc(Logging.create_time)
        ).layui_paginate_json(schema=LoggingOutSchema)
        return TableApi(data=data, count=total)
