# 厦门大学计算机专业 | 前华为工程师
# 专注《零基础学编程系列》  http://lblbc.cn/blog
# 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
# 公众号：蓝不蓝编程
import uvicorn
from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

import dao
import networkModels
from database import SessionLocal, engine, Base

Base.metadata.create_all(bind=engine)  # 数据库初始化，如果没有库或者表，会自动创建

app = FastAPI()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/news/categories", response_model=networkModels.QueryCategoryListResp)
def query_categories(db: Session = Depends(get_db)):
    result = dao.query_categories(db=db)
    return {"code": 0, "msg": "", "data": result}


@app.get("/news/news", response_model=networkModels.QueryAppListResp)
def query_app_by_category(categoryId: str, db: Session = Depends(get_db)):
    result = dao.query_by_category(db=db, category_id=categoryId)
    return {"code": 0, "msg": "", "data": result}


@app.get("/news/newsBySearch", response_model=networkModels.QueryAppListResp)
def query_app(keyword: str, db: Session = Depends(get_db)):
    result = dao.search(db=db, keyword=keyword)
    return {"code": 0, "msg": "", "data": result}


if __name__ == '__main__':
    uvicorn.run(app=app, host="192.168.31.10", port=8080)
