// 厦门大学计算机专业 | 前华为工程师
// 分享编程技术，没啥深度，但看得懂，适合初学者。
// Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import UIKit
import SwiftyJSON
import HandyJSON

class SearchViewModel: ObservableObject {
    @Published var dataList:[NewsInfo] = []
    
    func search(keyword: String) {
        LblProvider.request(.search(keyword: keyword)) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let resp = JSONDeserializer<QueryNewsResp>.deserializeFrom(json: json.description) {
                    if(resp.data != nil){
                        self.dataList = resp.data ?? []
                    }
                }
            }
        }
    }
}
