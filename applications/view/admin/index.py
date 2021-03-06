from flask import Blueprint, render_template
from flask_login import login_required, current_user
from sqlalchemy import desc

from applications.models import Notice

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')


# 首页
@admin_bp.get('/')
@login_required
def index():
    user = current_user
    return render_template('admin/index.html', user=user)


# 控制台页面
@admin_bp.get('/welcome')
@login_required
def welcome():
    notices = Notice.query.filter_by(active=1).order_by(desc(Notice.is_top)).order_by(desc(Notice.create_time)).all()
    return render_template('admin/console/console.html', notices=notices)
