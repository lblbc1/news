# 厦门大学计算机专业 | 前华为工程师
# 专注《零基础学编程系列》  http://lblbc.cn/blog
# 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
# 公众号：蓝不蓝编程
from typing import List

from pydantic import BaseModel


class BaseResponse(BaseModel):
    code: int
    msg: str


class CategoryResp(BaseModel):
    id: str
    name: str


class NewsInfoResp(BaseModel):
    id: str
    title: str
    imgUrl: str
    author: str
    link: str
    commentCount: int


class QueryCategoryListResp(BaseResponse):
    data: List[CategoryResp] = None


class QueryAppResp(BaseResponse):
    data: NewsInfoResp = None


class QueryAppListResp(BaseResponse):
    data: List[NewsInfoResp] = None
