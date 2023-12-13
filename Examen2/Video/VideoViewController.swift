
import UIKit
import youtube_ios_player_helper

class VideoViewController: UIViewController {
    
    var linkVideo: String?
    var idVideo: String?
    
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
    var videoView: YTPlayerView = {
        var videoView = YTPlayerView()
        return videoView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    init(linkVideo: String, idVideo: String){
        self.linkVideo = linkVideo
        self.idVideo = idVideo
        super.init(nibName: nil, bundle: nil)
    }

    func initUI(){
        
        view.addSubview(viewParent)
        viewParent.addAnchors(left: 20, top: 60, right: 20, bottom: 20)
        
        backImage.addTarget(self, action: #selector(regresarPage), for: .touchUpInside)
        viewParent.addSubview(backImage)
        backImage.addAnchorsAndSize(width: 20, height: 20, left: 10, top: 10, right: nil, bottom: nil)
        
        videoView.delegate = self
        viewParent.addSubview(videoView)
        videoView.addAnchors(left: 0, top: 10, right: 0, bottom: 0, withAnchor: .top, relativeToView: backImage)
        videoView.load(withVideoId: idVideo!, playerVars: ["playsinline": 1, "origin": linkVideo!])
    }
    
    @objc func regresarPage(){
        navigationController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension VideoViewController: YTPlayerViewDelegate{
    
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        print("Error view video::: \(error)")
    }
}
