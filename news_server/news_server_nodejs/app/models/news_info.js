/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
const { sequelize } = require('@core/db')
const { Model, DataTypes } = require('sequelize')
class NewsInfo extends Model {
}

NewsInfo.init({
  id: { type: DataTypes.TEXT, primaryKey: true },
  title: { type: DataTypes.TEXT },
  imgUrl: { type: DataTypes.TEXT },
  author: { type: DataTypes.TEXT },
  link: { type: DataTypes.TEXT },
  commentCount: { type: DataTypes.SMALLINT }
}, {
  sequelize,
  modelName: 'news_news',
  tableName: 'news_news'
})

module.exports = {
  NewsInfo
}
