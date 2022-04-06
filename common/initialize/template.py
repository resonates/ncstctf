from flask import session
from flask_login import current_user

from common.constant import AdminUser


def init_template_directives(app):
    @app.template_global()
    def auth(power: str) -> bool:
        if bool(power in session.get('permissions')):
            return True
        if current_user.id == AdminUser.id:
            return True
        return False
