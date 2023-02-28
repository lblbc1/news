package cn.lblbc.news.mapper;

import cn.lblbc.news.bean.NewsInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
@Repository
public interface NewsMapper {
    @Select(value = "select * from news_news where id = #{id}")
    NewsInfo query(@Param("id") long id);

    @Select(value = "SELECT nn.* FROM news_news_category nc,news_news nn WHERE nc.news_id=nn.id AND nc.category_id=#{categoryId}")
    List<NewsInfo> queryByCategory(@Param("categoryId") String categoryId);

    @Select(value = "select * from news_news where title like #{title}")
    List<NewsInfo> queryByName(@Param("title") String title);

}
