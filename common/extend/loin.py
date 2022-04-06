from flask_login import LoginManager

from modules.sys.models.user_role_power import User

login_manager = LoginManager()

login_manager.login_view = 'passport.login'


# login_manager.login_message = u'请登录以访问此页面'

@login_manager.user_loader
def load_user(user_id):
    user = User.query.get(int(user_id))
    return user
