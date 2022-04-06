import random

from flask import current_app, jsonify

from common.auth import login_required
from common.extend.cache import get_cache
from common.utils.tree import make_menu_tree
from common.view import View, route


class IndexView(View):
    route_base = '/'
    template_base = '/sys/'

    @route('/test')
    def test(self):
        ab = random.random()
        print(ab)
        get_cache().set('a', ab)
        a = get_cache().get("a")
        return str(a)

    @route('/')
    @login_required
    def index(self):
        user = '4'
        # user = current_user
        return self.render('index', user=user)

    # @login_required
    def welcome(self):
        return self.render('console/console')

    @route('/configs')
    # @login_required
    def configs(self):
        return dict(logo={
            # 网站名称
            "title": current_app.config.get("SYSTEM_NAME"),
            # 网站图标
            "image": "/static/admin/admin/images/logo.png"
            # 菜单配置
        }, menu={
            # 菜单数据来源
            "data": "/menu",
            "collaspe": False,
            # 是否同时只打开一个菜单目录
            "accordion": True,
            "method": "GET",
            # 是否开启多系统菜单模式
            "control": False,
            # 顶部菜单宽度 PX
            "controlWidth": 500,
            # 默认选中的菜单项
            "select": "0",
            # 是否开启异步菜单，false 时 data 属性设置为菜单数据，false 时为 json 文件或后端接口
            "async": True
        }, tab={
            # 是否开启多选项卡
            "enable": True,
            # 切换选项卡时，是否刷新页面状态
            "keepState": True,
            # 是否开启 Tab 记忆
            "session": True,
            # 最大可打开的选项卡数量
            "max": 30,
            "index": {
                # 标识 ID , 建议与菜单项中的 ID 一致
                "id": "10",
                # 页面地址
                "href": "/admin/welcome",
                # 标题
                "title": "首页"
            }
        }, theme={
            # 默认主题色，对应 colors 配置中的 ID 标识
            "defaultColor": "2",
            # 默认的菜单主题 dark-theme 黑 / light-theme 白
            "defaultMenu": "dark-theme",
            # 是否允许用户切换主题，false 时关闭自定义主题面板
            "allowCustom": True
        }, colors=[{
            "id": "1",
            "color": "#2d8cf0"
        },
            {
                "id": "2",
                "color": "#5FB878"
            },
            {
                "id": "3",
                "color": "#1E9FFF"
            }, {
                "id": "4",
                "color": "#FFB800"
            }, {
                "id": "5",
                "color": "darkgray"
            }
        ], links=current_app.config.get("SYSTEM_PANEL_LINKS"), other={
            # 主页动画时长
            "keepLoad": 1200,
            # 布局顶部主题
            "autoHead": False
        }, header=False)

    # 菜单
    @route('/menu')
    # @login_required
    def menu(self):
        menu_tree = make_menu_tree()
        return jsonify(menu_tree)
