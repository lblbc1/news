// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    @State private var searchText : String = ""
    
    var body: some View {
        SearchBar(text: $searchText){
            searchViewModel.search(keyword: searchText)
        }
        
        List {
            ForEach(searchViewModel.dataList , id: \.self){ item in
//                Link(destination: URL(string: item.link)!, label: {
//                    NewsItemView(newsInfo: item)
//                })
                NavigationLink(destination: LblWebView(url:item.link)){
                    NewsItemView(newsInfo: item)
                }
            }
        }
    }
}
