# 厦门大学计算机专业 | 前华为工程师
# 专注《零基础学编程系列》  http://lblbc.cn/blog
# 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
# 公众号：蓝不蓝编程
from sqlalchemy.orm import Session
import models


def query_categories(db: Session):
    q = db.query(models.Category.id, models.Category.name)
    return q.all()


def query_by_category(db: Session, category_id: str):
    q = db.query(models.NewsInfo.id, models.NewsInfo.img_url.label("imgUrl"), models.NewsInfo.link.label("link"),
                 models.NewsInfo.title, models.NewsInfo.author, models.NewsInfo.comment_count.label("commentCount")) \
        .outerjoin(models.NewsCategory, models.NewsCategory.news_id == models.NewsInfo.id) \
        .where(models.NewsCategory.category_id == category_id)
    return q.all()


def search(db: Session, keyword: str):
    q = db.query(models.NewsInfo.id, models.NewsInfo.img_url.label("imgUrl"), models.NewsInfo.link.label("link"),
                 models.NewsInfo.title, models.NewsInfo.author, models.NewsInfo.comment_count.label("commentCount")) \
        .filter(models.NewsInfo.title.like('%' + keyword + '%'))
    return q.all()
