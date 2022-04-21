from applications.extensions import db


class QType(db.Enum):
    web = "web"
    misc = "Misc"
    reverse = "Reverse"
    pwn = "Pwn"
    crypto = "Crypto"


class ImageResource(db.Model):
    __tablename__ = 'image_resource'
    """
        上传的镜像资源
    """
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    STATUS_BUILDING = 'building'
    STATUS_ERROR = 'error'
    STATUS_SUCCESS = 'success'
    status = db.Column(db.String(8), default=STATUS_BUILDING, comment="状态")
    host_id = db.Column(db.Integer, db.ForeignKey('docker_host.id'))
    name = db.Column(db.String(32), comment="名称")
    version = db.Column(db.String(64), comment="版本")
    cpu = db.Column(db.Integer, comment="CPU个数")
    memory = db.Column(db.Integer, comment="内存大小M")
    file = db.Column(db.String(128), comment="文件名")
    host = db.relationship('Host', backref='image_resource')
    build_result = db.Column(db.String(4096), comment="镜像状态说明")


class Question(db.Model):
    __tablename__ = 'ctf_question'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    name = db.Column(db.String(256), nullable=False, comment='题目名称')
    type = db.Column(db.String(16), comment="分类")
    active = db.Column(db.Boolean(), default=True, comment="是否启用")
    score = db.Column(db.Integer, default=10, comment="积分")
    desc = db.Column(db.String(128), default="", comment="描述")
    flag = db.Column(db.String(64), comment="Flag", nullable=True)
    active_flag = db.Column(db.Boolean(), default=False, comment="是否时动态Flag")
    attachment = db.Column(db.JSON, comment="附件")
    image_id = db.Column(db.ForeignKey('image_resource.id', ondelete='CASCADE'), nullable=True)
    image = db.relationship(ImageResource)


class QuestionFile(db.Model):
    __tablename__ = 'question_file'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    question_id = db.Column(db.Integer, comment="关联的题目ID")
    filename = db.Column(db.String(32), comment='文件名')
    file_path = db.Column(db.String(128), comment="文件相对路径")


class ContainerResource(db.Model):
    __tablename__ = 'container_resource'
    """
        实际的容器资源 不一定是实际的主机容器  主要是用来记录用户对容器的使用 同时绑定Flag
    """
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    image_resource_id = db.Column(db.Integer, db.ForeignKey('image_resource.id'), comment="容器对应的镜像资源")
    container_name = db.Column(db.String(64), comment="容器名称")
    status = db.Column(db.Integer, comment="1-启用/2-销毁", default=1)
    container_id = db.Column(db.String(64), comment="容器的实际ID", nullable=True)
    flag = db.Column(db.String(64), nullable=True, comment="容器的Flag")
    container_status = db.Column(db.String(8), comment="容器状态 不实时显示")
    container_port = db.Column(db.String(64), comment="端口映射", nullable=True)
    addr = db.Column(db.String(64), comment="快照主机IP")
    user_id = db.Column(db.Integer, db.ForeignKey('admin_user.id'), comment="关联用户")
    image = db.relationship('ImageResource', backref='containers')
    destroy_time = db.Column(db.DateTime, comment="销毁时间")
    question_id = db.Column(db.Integer, db.ForeignKey('ctf_question.id'), comment="对应的题库")
    # 应该还需要对应用户


class Answer(db.Model):
    """
        答题记录表
    """
    status_ok = 1  # 有效
    status_error = 2  # "无效"
    status_cheat = 3  # "作弊"
    status_repeat = 4  # "有效不计分"

    status_choices = (
        (status_ok, "有效"),
        (status_error, "无效"),
        (status_cheat, "作弊"),
        (status_repeat, "有效不计分")
    )
    __tablename__ = 'answer'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='ID')
    status = db.Column(db.Integer, default=1, comment="状态")
    user_id = db.Column(db.Integer, db.ForeignKey('admin_user.id'), comment="关联用户")
    question_id = db.Column(db.Integer, db.ForeignKey('ctf_question.id'), comment="对应题目")
    rank = db.Column(db.Integer, comment="解题名次")
    flag = db.Column(db.String(64), comment="提交内容")
    score = db.Column(db.Integer(), default=True, comment="分数")
    ip = db.Column(db.String(64), comment="提交答案IP")

    @property
    def status_name(self):
        return dict(self.status_choices).get(self.status)
