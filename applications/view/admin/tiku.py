import json

from flask import Blueprint, jsonify, request
from flask import render_template

from applications.extensions import db
from applications.models.ctf import Question

tiku_bp= Blueprint('tiku', __name__, url_prefix='/tiku')


# 题目管理
@tiku_bp.get('/')
def main():
    return render_template('admin/tiku/main.html')
