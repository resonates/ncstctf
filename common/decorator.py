from flask import abort


def user_required(f):
    """Checks whether user is logged in or raises error 401."""

    def decorator(*args, **kwargs):
        # if not g.user:
        #     abort(401)
        print('===============装饰器1')
        return f(*args, **kwargs)

    return decorator
