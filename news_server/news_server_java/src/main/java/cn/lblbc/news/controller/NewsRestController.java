package cn.lblbc.news.controller;

import cn.lblbc.news.bean.NewsInfo;
import cn.lblbc.news.bean.Category;
import cn.lblbc.news.service.NewsService;
import cn.lblbc.news.service.CategoryService;
import cn.lblbc.base.Resp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
@RestController
@RequestMapping("/news")
public class NewsRestController {

    @Autowired
    private NewsService newsService;
    @Autowired
    private CategoryService categoryService;

    @GetMapping("categories")
    public Resp<List<Category>> queryCategory() {
        Resp<List<Category>> resp = new Resp<>();
        resp.setData(categoryService.query());
        return resp;
    }

    @GetMapping("/news/{id}")
    public Resp<NewsInfo> query(@PathVariable long id) {
        Resp<NewsInfo> resp = new Resp<>();
        resp.setData(newsService.query(id));
        return resp;
    }
    @GetMapping("news")
    public Resp<List<NewsInfo>> queryByCategory(@RequestParam("categoryId") String categoryId) {
        Resp<List<NewsInfo>> resp = new Resp<>();
        resp.setData(newsService.queryByCategory(categoryId));
        return resp;
    }

    @GetMapping("newsBySearch")
    public Resp<List<NewsInfo>> search(@RequestParam("keyword") String keyword) {
        Resp<List<NewsInfo>> resp = new Resp<>();
        resp.setData(newsService.queryByName(keyword));
        return resp;
    }

}
