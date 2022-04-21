import json

from flask import Blueprint, jsonify, request
from flask import render_template

from applications.extensions import db
from applications.models.ctf import Question

timu_bp= Blueprint('timu', __name__, url_prefix='/timu')


# 题目管理
@timu_bp.get('/')
def main():
    return render_template('admin/timu/main.html')

@timu_bp.route('/data', methods=['get'])
def question_list():
    return {
	"msg": "not data",
	"count": 30,
	"data": [{
			"id": "1",
			"image": "https://gw.alipayobjects.com/zos/rmsportal/gLaIAoVWTtLbBWZNYEMg.png",
			"title": "简单sql注入",
			"remark": "测试题",
			"time": "未答题"
		}, {
			"id": "2",
			"image": "https://gw.alipayobjects.com/zos/rmsportal/iXjVmWVHbCJAyqvDxdtx.png",
			"title": "xss注入",
			"remark": "测试题",
			"time": "未答题"
		}
	],
	"code": 0
}

# @timu_bp.route('/data', methods=['get'])
# def question_list():
#     """
#         题库列表 和题库添加
#         :data :subject 题目分类
#     :return:
#     """
#     page = int(request.args.get('page', 1))
#     page_size = int(request.args.get("limit", 10))
#     subject = request.args.get("subject")
#     search = request.args.get('search')
#     query = db.session.query(Question)
#     if subject:
#         query = query.filter(Question.type == subject)
#     if search:
#         query = query.filter(Question.name.contains(search))
#     page = query.order_by(Question.id.desc()).paginate(page=page, per_page=page_size)
#     data = []
#     for item in page.items:
#         if item.active and item.image:
#             host_id = item.image.host_id
#         else:
#             host_id = None
#         data.append({
#             "attachment": json.loads(item.attachment) if item.attachment else None,
#             "host_id": host_id,
#             "image_id": item.image_id,
#             "id": item.id,
#             "date_created": item.date_created.strftime("%Y-%m-%d %H:%M:%S") if item.date_created else None,
#             "date_modified": item.date_modified.strftime("%Y-%m-%d %H:%M:%S") if item.date_modified else None,
#             "name": item.name,
#             'type': item.type,
#             "active": item.active,
#             "flag": item.flag,
#             "active_flag": item.active_flag,
#             "score": item.score,
#             "desc": item.desc
#         })
#     return jsonify({
#         "count": page.total,
#         "data": data
#     })
