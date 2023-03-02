package main

/*
厦门大学计算机专业 | 前华为工程师
专注《零基础学编程系列》  http://lblbc.cn/blog
包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
公众号：蓝不蓝编程
*/
import (
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"lblbc.cn/news/config"
	"lblbc.cn/news/controllers"
	"lblbc.cn/news/repository"
)

var (
	db                 *gorm.DB                       = config.SetupDatabase()
	repo               repository.Repository          = repository.CreateRepository(db)
	categoryController controllers.CategoryController = controllers.CreateCategoryController(repo)
	newsController     controllers.NewsController     = controllers.CreateNewsController(repo)
)

func main() {
	defer config.CloseDatabaseConnection(db)
	r := gin.Default()

	r.GET("news/categories", categoryController.QueryCategory)
	r.GET("news/news", newsController.QueryByCategory)
	r.GET("news/newsBySearch", newsController.Search)

	r.Run(":8080")
}
