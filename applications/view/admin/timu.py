from flask import Blueprint, request
from flask import render_template
from sqlalchemy import func

from applications.extensions import db
from applications.models.ctf import Question, Answer

timu_bp = Blueprint('timu', __name__, url_prefix='/timu')


# 题目管理
@timu_bp.get('/')
def main():
    return render_template('admin/timu/main.html')


@timu_bp.route('/challenge', methods=['get'])
def challenge_list():
    """
        题目列表
    :return:
    """
    user = g.user
    if user:
        solved = [i[0] for i in
                  db.session.query(Answer.question_id).filter(Answer.user_id == user.id,
                                                              Answer.status == Answer.status_ok)]
    else:
        solved = []
    # 每个题目的解题人数
    solved_query = db.session.query(Answer.question_id, func.count(Answer.id)).filter(
        Answer.status == Answer.status_ok).group_by(Answer.question_id).all()
    solved_cnt_dict = {i[0]: i[1] for i in solved_query}
    subjects = request.args.get("subject")
    query = db.session.query(Question).filter(Question.active == 1)
    if subjects:
        query = query.filter(Question.type == subjects)
    data = []
    for item in query:
        data.append({
            "id": item.id,
            "type": item.type,
            "title": item.name,
            "score": item.score,
            "desc": item.desc,
            "active_flag": item.active_flag,
            "solved_cnt": solved_cnt_dict.get(item.id, 0),
            "is_solved": bool(item.id in solved)
        })
    return {
        "msg": "not data",
        "count": data.count(),
        "data": data}


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
