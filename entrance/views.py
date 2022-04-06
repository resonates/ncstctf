from modules.sys.view.user import UserView
from modules.sys.view.index import IndexView
from modules.sys.view.role import RoleView
from modules.sys.view.dict import DictView
from modules.sys.view.file import FileView
from modules.sys.view.password import PasswordView
from modules.sys.view.monitor import MonitorView
from modules.sys.view.power import PowerView
from modules.sys.view.log import LogView

# 系统视图集合
sys_view_lists: list = [
    # 用户视图
    UserView,
    IndexView,
    RoleView,
    PasswordView,
    PowerView,
    MonitorView,
    LogView,
    DictView,FileView
]
