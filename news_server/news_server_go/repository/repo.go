package repository

/*
厦门大学计算机专业 | 前华为工程师
专注《零基础学编程系列》  http://lblbc.cn/blog
包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
公众号：蓝不蓝编程
*/
import (
	"gorm.io/gorm"
	"lblbc.cn/news/entity"
)

type Repository interface {
	QueryByCategory(categoryId string) []entity.NewsInfo
	Search(keyword string) []entity.NewsInfo
	QueryCategory() []entity.Category
}

type repoImpl struct {
	db *gorm.DB
}

func CreateRepository(db *gorm.DB) Repository {
	return &repoImpl{db: db}
}

func (repo *repoImpl) QueryByCategory(categoryId string) []entity.NewsInfo {
	var data []entity.NewsInfo
	repo.db.Joins("left join news_news_category on news_news.id = news_news_category.News_id").Where("Category_id = ?", categoryId).Find(&data)
	return data
}

func (repo *repoImpl) Search(keyword string) []entity.NewsInfo {
	var data []entity.NewsInfo
	repo.db.Where("Title like ?", "%"+keyword+"%").Find(&data)
	return data
}

func (repo *repoImpl) QueryCategory() []entity.Category {
	var data []entity.Category
	repo.db.Find(&data)
	return data
}
