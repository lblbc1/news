# 厦门大学计算机专业 | 前华为工程师
# 专注《零基础学编程系列》  http://lblbc.cn/blog
# 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
# 公众号：蓝不蓝编程
from sqlalchemy import Column, Integer, String

from database import Base


class NewsInfo(Base):
    __tablename__ = "news_news"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(200))
    img_url = Column(String(200))
    author = Column(String(500))
    link = Column(String(500))
    comment_count = Column(Integer)


class Category(Base):
    __tablename__ = "news_category"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50))


class NewsCategory(Base):
    __tablename__ = "news_news_category"
    id = Column(Integer, primary_key=True, index=True)
    category_id = Column(String(50))
    news_id = Column(String(50))
