from flask_login import current_user
from functools import wraps
from flask import abort, request, jsonify, session
from flask_login import login_required

from common.constant import AdminUser

current_user = current_user


def auth(power: str):
    def decorator(func):
        @login_required
        @wraps(func)
        def wrapper(*args, **kwargs):

            if not power in session.get('permissions'):
                if current_user.id == AdminUser.id:
                    pass
                elif request.method == 'GET':
                    abort(403)
                else:
                    return jsonify(success=False, msg="权限不足!")

            return func(*args, **kwargs)

        return wrapper

    return decorator


login_required = login_required
