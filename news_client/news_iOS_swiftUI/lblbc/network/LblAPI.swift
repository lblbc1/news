// 厦门大学计算机专业 | 前华为工程师
// 分享编程技术，没啥深度，但看得懂，适合初学者。
// Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程

import Foundation
import Moya
import HandyJSON
import SwiftyJSON

let LblProvider = MoyaProvider<LblAPI>()


enum LblAPI {
    case queryCategory
    case queryByCategory(categoryId: String)
    case search(keyword: String)
}

extension LblAPI: TargetType {
    public var baseURL: URL {
        //Moya会把path中带的问号转为%3F，所以只能将带有问号路径的URL放到baseURL中来规避该问题
        switch self {
            case .queryByCategory(let categoryId):
                return URL(string: "https://lblbc.cn/news/news?categoryId=\(categoryId)")!
            case .search(let keyword):
                return URL(string: "https://lblbc.cn/news/newsBySearch?keyword=\(keyword)")!
            default:
                return URL(string: "https://lblbc.cn/")!
        }
    }
    
    var path: String {
        switch self {
            case .queryCategory: return "news/categories"
            default: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .queryCategory, .queryByCategory, .search:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .queryCategory, .queryByCategory, .search:
            return .requestPlain
        }
    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? {
        var headerDict = ["Content-Type":"application/json;charset=utf-8"]
        return headerDict
    }
}
