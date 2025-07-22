import SwiftUI
import WebKit

// WKWebView를 SwiftUI에서 사용할 수 있도록 래핑하는 구조체
struct WebView: UIViewRepresentable {
    
    // 표시할 웹사이트 URL
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString, let url = URL(string: safeString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

// 메인 화면을 구성하는 ContentView
struct ContentView: View {
    var body: some View {
        // WebView를 화면에 표시하고, intype88.shop URL을 전달
        // .edgesIgnoringSafeArea(.all)을 추가하여 전체 화면으로 표시
        WebView(urlString: "https://intype88.shop")
    }
}

// 미리보기용 코드 (수정할 필요 없음)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
