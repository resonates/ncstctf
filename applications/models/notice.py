import datetime

from marshmallow_sqlalchemy import SQLAlchemyAutoSchema

from applications.extensions import db


class Notice(db.Model):
    __tablename__ = 'notice'
    id = db.Column(db.Integer, primary_key=True)
    active = db.Column(db.Boolean(), default=True)
    is_top = db.Column(db.Boolean(), default=False)
    content = db.Column(db.String(1024), comment="内容")
    create_time = db.Column(db.DateTime, default=datetime.datetime.now, comment='创建时间')


class NoticeOutSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = Notice
        include_fk = True
        load_instance = True
