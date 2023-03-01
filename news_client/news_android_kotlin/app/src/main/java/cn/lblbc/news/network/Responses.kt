package cn.lblbc.news.network

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
class DefaultResp(var code: Int, var msg: String, var data: String?)

class QueryNewsByCategoryResp(var code: Int, var msg: String, var data: List<NewsInfo>?)

class NewsInfo(
    var id: String = "",
    var title: String = "",
    var imgUrl: String = "",
    var author: String = "",
    var link: String = "",
    var commentCount: Int = 0
)

class CategoryInfo(val id: String = "", val name: String = "")
class QueryCategoryResp(var code: Int, var msg: String, var data: List<CategoryInfo>?)

class QueryNewsResp(var code: Int, var msg: String, var data: NewsInfo?)

class SearchNewsResp(var code: Int, var msg: String, var data: List<NewsInfo>?)