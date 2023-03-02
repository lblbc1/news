/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
const Router = require('koa-router');
const { NewsDao } = require('@dao/news');
const { Resolve } = require('@lib/helper');
const res = new Resolve();

const router = new Router({
  prefix: '/news'
})

/**
 * 按照分类查询应用列表
 */
router.get('/news', async (ctx) => {
  const { categoryId } = ctx.query;
  const [err, data] = await NewsDao.queryByCategory(categoryId);
  if (!err) {
    ctx.response.status = 200;
    ctx.body = res.json(data)
  } else {
    ctx.body = res.fail(err)
  }
});

/**
 * 搜索应用
 */
router.get('/newsBySearch', async (ctx) => {
  const { keyword } = ctx.query;
  const [err, data] = await NewsDao.search(keyword);
  if (!err) {
    ctx.response.status = 200;
    ctx.body = res.json(data)
  } else {
    ctx.body = res.fail(err)
  }
});


module.exports = router
