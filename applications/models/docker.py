import datetime

from applications.extensions import db


class Host(db.Model):
    __tablename__ = 'docker_host'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    name = db.Column(db.String(256), unique=True, nullable=False, comment='设备名')
    ip = db.Column(db.String(256), unique=True, nullable=False, comment="外部访问连接")
    docker_api = db.Column(db.String(256), nullable=False, comment="地址")
    remark = db.Column(db.String(256), comment="备注", nullable=True)
    online_time = db.Column(db.DateTime, comment="最后一次在线时间")
    active = db.Column(db.Boolean(), default=True, comment="是否启用")
    system = db.Column(db.JSON(), comment="详情信息")
    create_time = db.Column(db.DateTime, default=datetime.datetime.now, comment='创建时间')
