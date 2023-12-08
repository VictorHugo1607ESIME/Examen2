
import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    var linkArticle: String?
    var viewParent : UIView = {
        var viewParent = UIView()
        viewParent.backgroundColor = SColors.backgroundDetail
        
        return viewParent
    }()
    var backImage : UIButton = {
        var arrow = UIButton()
        arrow.setImage(UIImage(named: "back_arrow"), for: .normal)
        arrow.tintColor = .darkGray
        return arrow
    }()
    var webView: WKWebView = {
        var webView = WKWebView()
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    init(linkArticle: String){
        self.linkArticle = linkArticle
        super.init(nibName: nil, bundle: nil)
    }

    func initUI(){
        
        view.addSubview(viewParent)
        viewParent.addAnchors(left: 20, top: 60, right: 20, bottom: 20)
        
        backImage.addTarget(self, action: #selector(regresarPage), for: .touchUpInside)
        viewParent.addSubview(backImage)
        backImage.addAnchorsAndSize(width: 20, height: 20, left: 10, top: 10, right: nil, bottom: nil)
        
        webView.navigationDelegate = self
        viewParent.addSubview(webView)
        webView.addAnchors(left: 0, top: 10, right: 0, bottom: 0, withAnchor: .top, relativeToView: backImage)
        let url = URL(string: linkArticle!)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @objc func regresarPage(){
        dismiss(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ArticleViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error view info::: \(error.localizedDescription)")
    }
}
