import datetime
from flask_login import UserMixin
from flask_marshmallow import Marshmallow
from marshmallow import fields
from werkzeug.security import generate_password_hash, check_password_hash
from common.model import BaseModel, Column, Integer, String, DateTime, relationship, SQLAlchemyAutoSchema, backref, \
    ForeignKey, Table

user_role = Table(
    "sys_user_role",
    Column("id", Integer, primary_key=True, autoincrement=True, comment='标识'),
    Column("user_id", Integer, ForeignKey("sys_user.id"), comment='用户编号'),
    Column("role_id", Integer, ForeignKey("sys_role.id"), comment='角色编号'),
)
role_power = Table(
    "sys_role_power",
    Column("id", Integer, primary_key=True, autoincrement=True, comment='标识'),
    Column("power_id", Integer, ForeignKey("sys_power.id"), comment='用户编号'),
    Column("role_id", Integer, ForeignKey("sys_role.id"), comment='角色编号'),
)


class Power(BaseModel):
    __tablename__ = 'sys_power'
    id = Column(Integer, primary_key=True, comment='权限编号')
    name = Column(String(255), comment='权限名称')
    type = Column(String(1), comment='权限类型')
    code = Column(String(30), comment='权限标识')
    url = Column(String(255), comment='权限路径')
    open_type = Column(String(10), comment='打开方式')
    parent_id = Column(Integer, comment='父类编号')
    icon = Column(String(128), comment='图标')
    sort = Column(Integer, comment='排序')
    create_time = Column(DateTime, default=datetime.datetime.now, comment='创建时间')
    update_time = Column(DateTime, default=datetime.datetime.now, onupdate=datetime.datetime.now, comment='更新时间')
    enable = Column(Integer, comment='是否开启')


# 权限models序列化类
class PowerOutSchema(Marshmallow().Schema):
    id = fields.Integer()
    title = fields.Str(attribute="name")
    type = fields.Str()
    code = fields.Str()
    href = fields.Str(attribute="url")
    openType = fields.Str(attribute="open_type")
    parent_id = fields.Integer()
    icon = fields.Str()
    sort = fields.Integer()
    create_time = fields.DateTime()
    update_time = fields.DateTime()
    enable = fields.Integer()

class PowerOutSchema2(Marshmallow().Schema):  # 序列化类
    powerId = fields.Str(attribute="id")
    powerName = fields.Str(attribute="name")
    powerType = fields.Str(attribute="type")
    powerUrl = fields.Str(attribute="url")
    openType = fields.Str(attribute="open_type")
    parentId = fields.Str(attribute="parent_id")
    icon = fields.Str()
    sort = fields.Integer()
    create_time = fields.DateTime()
    update_time = fields.DateTime()
    enable = fields.Integer()

class Role(BaseModel):
    __tablename__ = 'sys_role'
    id = Column(Integer, primary_key=True, comment='角色ID')
    name = Column(String(255), comment='角色名称')
    code = Column(String(255), comment='角色标识')
    enable = Column(Integer, comment='是否启用')
    remark = Column(String(255), comment='备注')
    details = Column(String(255), comment='详情')
    sort = Column(Integer, comment='排序')
    create_time = Column(DateTime, default=datetime.datetime.now, comment='创建时间')
    update_time = Column(DateTime, default=datetime.datetime.now, onupdate=datetime.datetime.now, comment='更新时间')
    power = relationship('Power', secondary="sys_role_power", backref=backref('role'))


class RoleOutSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = Role
        include_fk = True
        load_instance = True


class User(BaseModel, UserMixin):
    __tablename__ = 'sys_user'
    id = Column(Integer, primary_key=True, autoincrement=True, comment='用户ID')
    username = Column(String(20), comment='用户名')
    realname = Column(String(20), comment='真实名字')
    avatar = Column(String(255), comment='头像', default="/static/admin/admin/images/avatar.jpg")
    remark = Column(String(255), comment='备注')
    password_hash = Column(String(128), comment='哈希密码')
    enable = Column(Integer, default=1, comment='启用')
    dept_id = Column(Integer, comment='部门id')
    create_at = Column(DateTime, default=datetime.datetime.now, comment='创建时间')
    update_at = Column(DateTime, default=datetime.datetime.now, onupdate=datetime.datetime.now, comment='创建时间')
    role = relationship('Role', secondary="sys_user_role", backref=backref('user'), lazy='dynamic')

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def validate_password(self, password):
        return check_password_hash(self.password_hash, password)


# 如果要全换全部字段，就不要声明fields或exclude字段即可
class UserOutSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = User
        include_fk = True
        load_instance = True
        exclude = ['password_hash']

