/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/note
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
const { sequelize } = require('@core/db')
const { NewsInfo } = require('@models/news_info')

class NewsDao {

  static async queryByCategory(categoryId) {
    const { QueryTypes } = require('sequelize');
    let sql = "SELECT nn.id,nn.title,nn.img_url imgUrl,nn.author,nn.link,nn.comment_count commentCount FROM news_news_category ac,news_news nn WHERE ac.news_id=nn.id AND ac.category_id=" + categoryId
    try {
      let result = await sequelize.query(sql, { type: QueryTypes.SELECT });
      return [null, result]
    } catch (err) {
      console.log(err)
      return [err, null]
    }
  }

  static async search(keyword) {
    try {
      const seq = require('sequelize');
      const Op = seq.Op;
      let filter = { title: { [Op.like]: `%${keyword}%` } }
      let result = await NewsInfo.findAndCountAll({ where: filter, });
      return [null, result.rows];
    } catch (err) {
      return [err, null]
    }
  }
}

module.exports = {
  NewsDao
}
