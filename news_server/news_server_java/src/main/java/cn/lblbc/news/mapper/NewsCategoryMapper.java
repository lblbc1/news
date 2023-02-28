package cn.lblbc.news.mapper;

import cn.lblbc.news.bean.Category;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
@Repository
public interface NewsCategoryMapper {

    @Select(value = "SELECT * FROM news_category")
    List<Category> query();

}
