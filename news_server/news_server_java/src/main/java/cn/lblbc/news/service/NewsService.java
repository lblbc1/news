package cn.lblbc.news.service;

import cn.lblbc.news.bean.NewsInfo;
import cn.lblbc.news.mapper.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
@Service
public class NewsService {
    @Autowired
    private NewsMapper newsMapper;

    public NewsInfo query(long id) {
        return newsMapper.query(id);
    }

    public List<NewsInfo> queryByCategory(String categoryId) {
        return newsMapper.queryByCategory(categoryId);
    }

    public List<NewsInfo> queryByName(String name) {
        return newsMapper.queryByName("%" + name + "%");
    }
}
