// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI

struct MineView: View {

    var body: some View {
        HStack{
            Spacer()
            Text("by 蓝不蓝编程").font(.title3)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(hex: 0xF4F4F4))
    }
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
