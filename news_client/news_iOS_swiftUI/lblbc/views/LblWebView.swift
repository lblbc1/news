// 厦门大学计算机专业 | 前华为工程师
// 专注《零基础学编程系列》  http://lblbc.cn/blog
// 包含：Java | 安卓 | 前端 | Flutter | iOS | 小程序 | 鸿蒙
// 公众号：蓝不蓝编程
import SwiftUI
import WebKit

struct LblWebView: UIViewRepresentable {
    
    var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url, let requetURL = URL(string: url)  {
            uiView.load(URLRequest(url: requetURL))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
        
    class Coordinator: NSObject,WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { (result, error) in
                print("didFinish:\(String(describing: result ?? ""))")
            }
        }
    }
}
