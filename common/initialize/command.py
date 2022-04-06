import click
from sqlalchemy.exc import OperationalError

from common.constant import AdminUser
from common.extend.orm import db
from modules.sys.models.user_role_power import User, Power


def init_script(app):
    @app.cli.group()
    def sys():
        """
        后台admin命令
        """
        pass

    @sys.command()
    def init():
        """
        初始化数据库（增加必要的数据）
        """
        try:
            admin_user = User(
                id=1,
                username="admin"
            )
            admin_user.set_password('123456')
            db.session.add(
                # 系统管理员
                admin_user)
            db.session.add(
                # 一级菜单

                Power(
                    id=1,
                    name='系统管理',
                    type='0',
                    code='',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon='layui-icon layui-icon-set-fill',
                    sort=1,
                    enable=1
                ))
            db.session.add(

                # 二级菜单

                Power(
                    id=2,
                    name='用户管理',
                    type='1',
                    code='admin:user:main',
                    url='/admin/user/',
                    open_type='_iframe',
                    parent_id=1,
                    icon='layui-icon layui-icon layui-icon layui-icon layui-icon-rate',
                    sort=1,
                    enable=1
                ))

            db.session.add(
                Power(
                    id=3,
                    name='用户增加',
                    type='2',
                    code='admin:user:add',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon='layui-icon layui-icon-add-circle',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=4,
                    name='用户编辑',
                    type='2',
                    code='admin:user:edit',
                    url=None,
                    open_type=None,
                    parent_id=2,
                    icon='layui-icon layui-icon-rate',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=5,
                    name='用户删除',
                    type='2',
                    code='admin:user:remove',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon=None,
                    sort=1,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=6,
                    name='权限管理',
                    type='1',
                    code='admin:power:main',
                    url='/admin/power/',
                    open_type='_iframe',
                    parent_id=1,
                    icon='layui-icon layui-icon-set-fill',
                    sort=2,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=7,
                    name='权限增加',
                    type='2',
                    code='admin:power:add',
                    url=None,
                    open_type=None,
                    parent_id=3,
                    icon='layui-icon layui-icon-add-circle',
                    sort=1,
                    enable=1
                ))

            db.session.add(
                Power(
                    id=8,
                    name='权限编辑',
                    type='2',
                    code='admin:power:edit',
                    url=None,
                    open_type=None,
                    parent_id='4',
                    icon='layui-icon layui-icon-edit',
                    sort=1,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=9,
                    name='角色管理',
                    type='1',
                    code='admin:role:main',
                    url='/admin/role',
                    open_type='_iframe',
                    parent_id=1,
                    icon='layui-icon layui-icon-username',
                    sort=3,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=10,
                    name='角色增加',
                    type='2',
                    code='admin:role:add',
                    url=None,
                    open_type=None,
                    parent_id='9',
                    icon='layui-icon layui-icon-add-circle',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=11,
                    name='角色编辑',
                    type='2',
                    code='admin:role:edit',
                    url=None,
                    open_type=None,
                    parent_id='9',
                    icon='layui-icon layui-icon-edit',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=12,
                    name='角色删除',
                    type='2',
                    code='admin:role:remove',
                    url=None,
                    open_type=None,
                    parent_id='9',
                    icon='layui-icon layui-icon-delete',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=13,
                    name='角色授权',
                    type='2',
                    code='admin:role:power',
                    url=None,
                    open_type=None,
                    parent_id='9',
                    icon='layui-icon layui-icon-set-fill',
                    sort=1,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=14,
                    name='系统监控',
                    type='1',
                    code='admin:monitor:main',
                    url='/admin/monitor',
                    open_type='_iframe',
                    parent_id=1,
                    icon='layui-icon layui-icon-vercode',
                    sort=4,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=15,
                    name='日志管理',
                    type='1',
                    code='admin:log:main',
                    url='/admin/log',
                    open_type='_iframe',
                    parent_id=1,
                    icon='layui-icon layui-icon-read',
                    sort=5,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=16,
                    name='文件管理',
                    type='0',
                    code='',
                    url=None,
                    open_type=None,
                    parent_id=0,
                    icon='layui-icon layui-icon-camera',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=17,
                    name='图片上传',
                    type='1',
                    code='admin:file:main',
                    url='/admin/file',
                    open_type='_iframe',
                    parent_id=7,
                    icon='layui-icon layui-icon-camera',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=18,
                    name='权限删除',
                    type='2',
                    code='admin:power:remove',
                    url=None,
                    open_type=None,
                    parent_id=4,
                    icon='layui-icon layui-icon-delete',
                    sort=1,
                    enable=1
                ))
            db.session.add(

                Power(
                    id=19,
                    name='图片增加',
                    type='2',
                    code='admin:file:add',
                    url=None,
                    open_type=None,
                    parent_id='18',
                    icon='layui-icon layui-icon-add-circle',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=20,
                    name='图片删除',
                    type='2',
                    code='admin:file:delete',
                    url=None,
                    open_type=None,
                    parent_id='18',
                    icon='layui-icon layui-icon-delete',
                    sort=1,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=21,
                    name='数据字典',
                    type='1',
                    code='admin:dict:main',
                    url='/admin/dict',
                    open_type='_iframe',
                    parent_id='1',
                    icon='layui-icon layui-icon-console',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=22,
                    name='字典增加',
                    type='2',
                    code='admin:dict:add',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon=None,
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=23,
                    name='字典修改',
                    type='2',
                    code='admin:dict:edit',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon='layui-icon layui-icon-set-fill',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=24,
                    name='字典删除',
                    type='2',
                    code='admin:dict:remove',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon=None,
                    sort=1,
                    enable=1
                ))

            # 二级菜单
            db.session.add(
                Power(
                    id=25,
                    name='部门管理',
                    type='1',
                    code='_iframe',
                    url='/dept',
                    open_type='_iframe',
                    parent_id='1',
                    icon='layui-icon layui-icon-group',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=26,
                    name='部门增加',
                    type='2',
                    code='admin:dept:add',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon=None,
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=27,
                    name='部门编辑',
                    type='2',
                    code='admin:dept:edit',
                    url=None,
                    open_type=None,
                    parent_id='0',
                    icon='layui-icon layui-icon-set-fill',
                    sort=1,
                    enable=1
                ))
            db.session.add(
                Power(
                    id=28,
                    name='部门删除',
                    type='2',
                    code='admin:dept:remove',
                    url='',
                    open_type='',
                    parent_id='48',
                    icon='layui-icon layui-icon-set-fill',
                    sort=1,
                    enable=1
                ))

            db.session.commit()
        except OperationalError as e:
            if e.args[0].split('(')[2].split(',')[0] == '2003':
                quit(f"数据库未能正常连接\n{e}")
            if e.args[0].split('(')[2].split(',')[0] == '1049':
                quit(f"没有找到{app.config.get('MYSQL_DATABASE')}数据库\n"
                     f"如果第一次启动或没有创建{app.config.get('MYSQL_DATABASE')}数据库，请使用如下命令\nflask db migrate\nflask db upgrade\n{e}")


    @sys.command()
    @click.option('--firstpassword', prompt="请输入密码", help='新增的api所属的模块')
    @click.option('--secondpassword', prompt="请再次输入密码", help='新增的api所属的模块')
    def changeadmin(firstpassword, secondpassword):
        """
        更改系统管理员的密码，没有则创建
        """
        if firstpassword != secondpassword:
            quit("俩次密码不一样")
        u = User.query.filter_by(id=AdminUser.id).first()
        if u:
            u.set_password(firstpassword)
        else:
            u = User(
                id=1,
                username="admin"
            )
            u.set_password(firstpassword)
            db.session.add(
                u
            )
        db.session.commit()
