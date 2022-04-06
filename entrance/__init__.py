from flask import Flask
import os
from common.extend.logger import config_logger
from common.initialize.command import init_script
from common.initialize.logo import print_logo
from common.initialize.template import init_template_directives
from entrance.bps import bp_lists
from entrance.config.config import ServerConfig
from entrance.extensions import init_extensions


def create_app():
    # 配置logger
    # config_logger()

    # 初始化flask
    app = Flask(
        __name__,
        template_folder='../templates',
        static_folder="../static"
    )

    # 加载配置文件


    app.config.from_object(ServerConfig())

    # 注册扩展
    init_extensions(app)

    # 注册蓝图
    for bp in bp_lists:
        app.register_blueprint(bp)

    # 注册全局模板函数
    init_template_directives(app)

    init_script(app)

    # 启动文字
    if os.environ.get('WERKZEUG_RUN_MAIN') == 'true':
        print_logo(app)
    return app
