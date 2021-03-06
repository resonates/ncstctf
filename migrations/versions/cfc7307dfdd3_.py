"""empty message

Revision ID: cfc7307dfdd3
Revises: 7634e028e338
Create Date: 2022-04-12 19:20:02.935411

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'cfc7307dfdd3'
down_revision = '7634e028e338'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('docker_host',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('name', sa.String(length=256), nullable=False, comment='用户名'),
    sa.Column('ip', sa.String(length=256), nullable=False, comment='外部访问连接'),
    sa.Column('docker_api', sa.String(length=256), nullable=False, comment='地址'),
    sa.Column('remark', sa.String(length=256), nullable=True, comment='备注'),
    sa.Column('online_time', sa.DateTime(), nullable=True, comment='最后一次在线时间'),
    sa.Column('active', sa.Boolean(), nullable=True, comment='是否启用'),
    sa.Column('system', sa.JSON(), nullable=True, comment='详情信息'),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('ip'),
    sa.UniqueConstraint('name')
    )
    op.create_table('question_file',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('question_id', sa.Integer(), nullable=True, comment='关联的题目ID'),
    sa.Column('filename', sa.String(length=32), nullable=True, comment='文件名'),
    sa.Column('file_path', sa.String(length=128), nullable=True, comment='文件相对路径'),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('image_resource',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('status', sa.String(length=8), nullable=True, comment='状态'),
    sa.Column('host_id', sa.Integer(), nullable=True),
    sa.Column('name', sa.String(length=32), nullable=True, comment='名称'),
    sa.Column('version', sa.String(length=64), nullable=True, comment='版本'),
    sa.Column('cpu', sa.Integer(), nullable=True, comment='CPU个数'),
    sa.Column('memory', sa.Integer(), nullable=True, comment='内存大小M'),
    sa.Column('file', sa.String(length=128), nullable=True, comment='文件名'),
    sa.Column('build_result', sa.String(length=4096), nullable=True, comment='镜像状态说明'),
    sa.ForeignKeyConstraint(['host_id'], ['docker_host.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('ctf_question',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('name', sa.String(length=256), nullable=False, comment='题目名称'),
    sa.Column('type', sa.String(length=16), nullable=True, comment='分类'),
    sa.Column('active', sa.Boolean(), nullable=True, comment='是否启用'),
    sa.Column('score', sa.Integer(), nullable=True, comment='积分'),
    sa.Column('desc', sa.String(length=128), nullable=True, comment='描述'),
    sa.Column('flag', sa.String(length=64), nullable=True, comment='Flag'),
    sa.Column('active_flag', sa.Boolean(), nullable=True, comment='是否时动态Flag'),
    sa.Column('attachment', sa.JSON(), nullable=True, comment='附件'),
    sa.Column('image_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['image_id'], ['image_resource.id'], ondelete='CASCADE'),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('answer',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('status', sa.Integer(), nullable=True, comment='状态'),
    sa.Column('user_id', sa.Integer(), nullable=True, comment='关联用户'),
    sa.Column('question_id', sa.Integer(), nullable=True, comment='对应题目'),
    sa.Column('rank', sa.Integer(), nullable=True, comment='解题名次'),
    sa.Column('flag', sa.String(length=64), nullable=True, comment='提交内容'),
    sa.Column('score', sa.Integer(), nullable=True, comment='分数'),
    sa.Column('ip', sa.String(length=64), nullable=True, comment='提交答案IP'),
    sa.ForeignKeyConstraint(['question_id'], ['ctf_question.id'], ),
    sa.ForeignKeyConstraint(['user_id'], ['admin_user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('container_resource',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False, comment='ID'),
    sa.Column('image_resource_id', sa.Integer(), nullable=True, comment='容器对应的镜像资源'),
    sa.Column('container_name', sa.String(length=64), nullable=True, comment='容器名称'),
    sa.Column('status', sa.Integer(), nullable=True, comment='1-启用/2-销毁'),
    sa.Column('container_id', sa.String(length=64), nullable=True, comment='容器的实际ID'),
    sa.Column('flag', sa.String(length=64), nullable=True, comment='容器的Flag'),
    sa.Column('container_status', sa.String(length=8), nullable=True, comment='容器状态 不实时显示'),
    sa.Column('container_port', sa.String(length=64), nullable=True, comment='端口映射'),
    sa.Column('addr', sa.String(length=64), nullable=True, comment='快照主机IP'),
    sa.Column('user_id', sa.Integer(), nullable=True, comment='关联用户'),
    sa.Column('destroy_time', sa.DateTime(), nullable=True, comment='销毁时间'),
    sa.Column('question_id', sa.Integer(), nullable=True, comment='对应的题库'),
    sa.ForeignKeyConstraint(['image_resource_id'], ['image_resource.id'], ),
    sa.ForeignKeyConstraint(['question_id'], ['ctf_question.id'], ),
    sa.ForeignKeyConstraint(['user_id'], ['admin_user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.drop_constraint('admin_role_power_ibfk_2', 'admin_role_power', type_='foreignkey')
    op.drop_constraint('admin_role_power_ibfk_1', 'admin_role_power', type_='foreignkey')
    op.create_foreign_key(None, 'admin_role_power', 'admin_power', ['power_id'], ['id'])
    op.create_foreign_key(None, 'admin_role_power', 'admin_role', ['role_id'], ['id'])
    op.drop_constraint('admin_user_role_ibfk_1', 'admin_user_role', type_='foreignkey')
    op.drop_constraint('admin_user_role_ibfk_2', 'admin_user_role', type_='foreignkey')
    op.create_foreign_key(None, 'admin_user_role', 'admin_user', ['user_id'], ['id'])
    op.create_foreign_key(None, 'admin_user_role', 'admin_role', ['role_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'admin_user_role', type_='foreignkey')
    op.drop_constraint(None, 'admin_user_role', type_='foreignkey')
    op.create_foreign_key('admin_user_role_ibfk_2', 'admin_user_role', 'admin_user', ['user_id'], ['id'], onupdate='RESTRICT', ondelete='RESTRICT')
    op.create_foreign_key('admin_user_role_ibfk_1', 'admin_user_role', 'admin_role', ['role_id'], ['id'], onupdate='RESTRICT', ondelete='RESTRICT')
    op.drop_constraint(None, 'admin_role_power', type_='foreignkey')
    op.drop_constraint(None, 'admin_role_power', type_='foreignkey')
    op.create_foreign_key('admin_role_power_ibfk_1', 'admin_role_power', 'admin_power', ['power_id'], ['id'], onupdate='RESTRICT', ondelete='RESTRICT')
    op.create_foreign_key('admin_role_power_ibfk_2', 'admin_role_power', 'admin_role', ['role_id'], ['id'], onupdate='RESTRICT', ondelete='RESTRICT')
    op.drop_table('container_resource')
    op.drop_table('answer')
    op.drop_table('ctf_question')
    op.drop_table('image_resource')
    op.drop_table('question_file')
    op.drop_table('docker_host')
    # ### end Alembic commands ###
