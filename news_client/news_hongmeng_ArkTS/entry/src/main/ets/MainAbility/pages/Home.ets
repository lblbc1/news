import NewsList from './NewsList';
/**
 * 厦门大学计算机专业 | 前华为工程师
 * 专注《零基础学编程系列》  http://lblbc.cn/blog
 * 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
 * 公众号：蓝不蓝编程
 */
import router from '@ohos.router';
import { httpRequestGet } from '../../common/utils/HttpUtil'

@Entry
@Component
struct Home {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State noteList: Array<any> = [];
  private controller: TabsController = new TabsController();
  @State tabBarArray: Array<any> = [];
  @State selectedId: string = "";

  @Builder TabBuilder(id: string, name: string) {
    Column() {
      Text(name)
        .fontColor(this.selectedId === id ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.selectedId === id ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.tabBarArray, tabsItem => {
          TabContent() {
            NewsList({ categoryId: tabsItem.id })
          }
          .tabBar(this.TabBuilder(tabsItem.id, tabsItem.name))
        }, item => item.id);
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .barHeight(56)
      .animationDuration(400)
      .width('100%')
      .height('100%')
      .onChange((index: number) => {
        this.selectedId = this.tabBarArray[index].id
      })
    }.width('100%')
  }

  aboutToAppear() {
    this.queryCategory()
  }

  private async queryCategory() {
    var url = 'news/categories'
    var data = await httpRequestGet(url)
    this.tabBarArray = data.data.slice(0,3)
  }
}