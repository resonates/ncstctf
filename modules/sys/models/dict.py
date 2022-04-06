import datetime

from common.model import BaseModel, Column, Integer, String, DateTime, SQLAlchemyAutoSchema


class DictType(BaseModel):
    __tablename__ = 'sys_dict_type'
    id = Column(Integer, primary_key=True)
    type_name = Column(String(255), comment='字典类型名称')
    type_code = Column(String(255), comment='字典类型标识')
    description = Column(String(255), comment='字典类型描述')
    enable = Column(Integer, comment='是否开启')
    create_time = Column(DateTime, default=datetime.datetime.now, comment='创建时间')
    update_time = Column(DateTime, default=datetime.datetime.now, onupdate=datetime.datetime.now, comment='更新时间')


class DictTypeOutSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = DictType
        include_fk = True
        load_instance = True


class DictData(BaseModel):
    __tablename__ = 'sys_dict_data'
    id = Column(Integer, primary_key=True)
    data_label = Column(String(255), comment='字典类型名称')
    data_value = Column(String(255), comment='字典类型标识')
    type_code = Column(String(255), comment='字典类型描述')
    is_default = Column(Integer, comment='是否默认')
    enable = Column(Integer, comment='是否开启')
    remark = Column(String(255), comment='备注')
    create_time = Column(DateTime, default=datetime.datetime.now, comment='创建时间')
    update_time = Column(DateTime, default=datetime.datetime.now, onupdate=datetime.datetime.now, comment='更新时间')


class DictDataSchema(SQLAlchemyAutoSchema):
    class Meta:
        model = DictData
        include_fk = True
        load_instance = True
