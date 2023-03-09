import prompt from '@ohos.prompt';
import router from '@ohos.router';
/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
import { httpRequestGet } from '../../common/utils/HttpUtil'

@Component
export default struct NewsList {
  categoryId: string;
  @State appList: Array<any> = [];

  build() {
    List() {
      ForEach(this.appList, item => {
        ListItem() {
          Row() {
            Image(item.imgUrl).width(40).height(40)
            Column() {
              Text(item.title).fontSize(16).fontColor('#222222')
              Row() {
                Text(item.author).fontSize(16).fontColor('#6C6C6C')
                Text(item.commentCount).fontSize(16).fontColor('#6C6C6C').margin({ left: 10 })
              }.margin({ top: 5 })
            }.alignItems(HorizontalAlign.Start)
            .margin({ left: 10 })
          }.margin({ left: 10, top: 10, right: 10 })
          .onClick(() => {
            router.push({ url: "pages/WebView" ,params: {url: item.link}})
          })
        }
      }, (item, index) => JSON.stringify(item) + index.toString())
    }
  }

  aboutToAppear() {
    this.queryByCategory()
  }

  private async queryByCategory() {
    var url = "news/news?categoryId=" + this.categoryId
    var data = await httpRequestGet(url)
    this.appList = data.data
  }
}