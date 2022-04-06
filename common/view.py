import sqlalchemy
from flask import Blueprint as FlaskBlueprint, jsonify, render_template, url_for
from flask_classful import FlaskView, route
from flask_marshmallow import Marshmallow

from common.model import BaseModel


class Blueprint(FlaskBlueprint):
    def register_views(self, views_lists):
        for views in views_lists:
            views.register(self, base_class=View)

    def register_child_bp(self, bp_lists):
        for bp in bp_lists:
            self.register_blueprint(bp)


Blueprint = Blueprint
route = route
url_for = url_for


class View(FlaskView):
    template_base = None

    def render(self, path: str, **context):
        if self.template_base:
            return render_template(self.template_base + path + '.html', **context)
        else:
            render_template(path + '.html', **context)

    def serialize(self, data: list, schema: Marshmallow().Schema = None, ) -> list:
        if not data:
            return data
        if issubclass(type(next(iter(data))), BaseModel):
            if not schema:
                raise TypeError("请serialize方法的输入模型的序列化类参数")
            return schema(many=True).dump(data)
        if isinstance(next(iter(data)), sqlalchemy.engine.row.Row):
            return [dict(i) for i in data]

    def api_data(self, data):
        return jsonify(data)

    @staticmethod
    def success_api(msg: str = ''):
        return {
            'success': True,
            'msg': msg
        }

    @staticmethod
    def fail_api(msg: str = ''):
        return {
            'success': False,
            'msg': msg
        }

    @staticmethod
    def TableApi(data: list, count: int, limit: int=0, msg: str = ''):

        """ 动态表格渲染响应 """
        return jsonify({
            'msg': msg,
            'code': 0,
            'data': data,
            'count': count,
            'limit': limit
        })
