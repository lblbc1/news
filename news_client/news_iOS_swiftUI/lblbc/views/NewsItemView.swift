// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程
import SwiftUI
import SDWebImageSwiftUI


struct NewsItemView: View {
    var newsInfo: NewsInfo
    var body: some View {
        HStack{
            Text(newsInfo.title).lineLimit(3)
            WebImage(url: URL(string: newsInfo.imgUrl))
                .placeholder{Color.gray}
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
        
    }
}
