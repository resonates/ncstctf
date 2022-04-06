from flask import Flask

from common.extend.celeryer import register_celery
from common.extend.limit import limiter
from common.extend.loin import login_manager
from common.extend.orm import db
from common.extend.migrate import migrate


def init_extensions(app: Flask):
    db.init_app(app)
    migrate.init_app(app)
    register_celery(app)
    limiter.init_app(app)
    login_manager.init_app(app)
