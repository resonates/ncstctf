from typing import List

from common.view import Blueprint
from entrance.views import sys_view_lists

# 系统蓝图

sys = Blueprint('sys', __name__, url_prefix='/')
# 注册视图
sys.register_views(views_lists=sys_view_lists)

# 如果需要前台，将系统蓝图的 url_prefix='/'改为'/admin'即可
# # 前台蓝图
# index = Blueprint('sys', __name__, url_prefix='/')


# 列表中的bp将被进行注册
bp_lists: List[Blueprint] = [
    sys
]
