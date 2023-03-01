package cn.lblbc.news.network

import retrofit2.http.*

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
interface ApiService {
    @GET("news/news")
    suspend fun queryByCategory(@Query("categoryId") categoryId: String): QueryNewsByCategoryResp?

    @GET("news/categories")
    suspend fun queryCategory(): QueryCategoryResp?

    @GET("news/news/{id}")
    suspend fun queryApp(@Path("id") id: String): QueryNewsResp?

    @GET("news/newsBySearch")
    suspend fun search(@Query("keyword") keyword: String): SearchNewsResp?
}