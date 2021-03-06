"""empty message

Revision ID: 4dc550acfb3f
Revises: cfc7307dfdd3
Create Date: 2022-04-13 15:15:08.160105

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '4dc550acfb3f'
down_revision = 'cfc7307dfdd3'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('docker_host', sa.Column('create_time', sa.DateTime(), nullable=True, comment='创建时间'))
    op.alter_column('docker_host', 'name',
               existing_type=mysql.VARCHAR(collation='utf8mb4_general_ci', length=256),
               comment='设备名',
               existing_comment='用户名',
               existing_nullable=False)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('docker_host', 'name',
               existing_type=mysql.VARCHAR(collation='utf8mb4_general_ci', length=256),
               comment='用户名',
               existing_comment='设备名',
               existing_nullable=False)
    op.drop_column('docker_host', 'create_time')
    # ### end Alembic commands ###
