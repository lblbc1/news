// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI

@main
struct LblApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView().accentColor(.main_color)
        }
    }
}

struct TabbarView: View {
    @State var selectedTab = Tab.category
    
    enum Tab: Int {
        case category, mine
    }
    
    func tabbarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            Text(text)
        }
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                HomeView().tabItem{
                    self.tabbarItem(text: "首页", image: "house")
                }.tag(Tab.category)
                MineView().tabItem{
                    self.tabbarItem(text: "我的", image: "person")
                }.tag(Tab.mine)
            }
        }
    }
}
