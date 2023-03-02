package controllers

/*
厦门大学计算机专业 | 前华为工程师
专注《零基础学编程系列》  http://lblbc.cn/blog
包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
公众号：蓝不蓝编程
*/
import (
	"net/http"

	"github.com/gin-gonic/gin"
	"lblbc.cn/news/entity"
	"lblbc.cn/news/helper"
	"lblbc.cn/news/repository"
)

type NewsController interface {
	QueryByCategory(c *gin.Context)
	Search(c *gin.Context)
}

type newsController struct {
	repo repository.Repository
}

func CreateNewsController(repo repository.Repository) NewsController {
	return &newsController{repo: repo}
}

func (c *newsController) Search(ctx *gin.Context) {
	keyword := ctx.Query("keyword")
	var data []entity.NewsInfo = c.repo.Search(keyword)
	response := helper.SuccessResponse(0, "", data)
	ctx.JSON(http.StatusOK, response)
}

func (c *newsController) QueryByCategory(ctx *gin.Context) {
	categoryId := ctx.Query("categoryId")
	var data []entity.NewsInfo = c.repo.QueryByCategory(categoryId)
	response := helper.SuccessResponse(0, "", data)
	ctx.JSON(http.StatusOK, response)
}
