
import UIKit

class DetailShipViewController: UIViewController{
    
    var ship: EstrellaDeLaMuerte
    var itemFocusMarker = 0
    
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
    var missionName : UILabel = {
        var missionName = UILabel()
        missionName.font = UIFont(name: "Arial", size: 16)
        missionName.textColor = .gray
        missionName.textAlignment = .center
        return missionName
    }()
    var detailText : UILabel = {
        var detailText = UILabel()
        detailText.font = UIFont(name: "Arial Bold", size: 22)
        detailText.textColor = SColors.textBlueDetail
        return detailText
    }()
    var dateShip : UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    var siteShip : UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    var rocketNameShip : UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    var rocketTypeShip : UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    var descriptionShip : UITextView = {
        var label = UITextView()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .gray
        label.backgroundColor = .clear
        label.isScrollEnabled = false
        return label
    }()
    var btnPlayVideo: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: "play"), for: .normal)
        btn.backgroundColor = SColors.btnPlayVideoDetail
        btn.layer.cornerRadius = 22
        btn.clipsToBounds = true
        
        return btn
    }()
    var btnYoutubeVideo: UIButton = {
        var btn = UIButton()
        btn.setTitle("YT Video", for: .normal)
        btn.backgroundColor = SColors.btnPlayVideoDetail
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        
        return btn
    }()
    var btnInfo: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: "info"), for: .normal)
        btn.backgroundColor = SColors.btnGoToInfoDetail
        btn.layer.cornerRadius = 22
        btn.clipsToBounds = true
        
        return btn
    }()
    var btnLaunchInfo: UIButton = {
        var btn = UIButton()
        btn.setTitle("Launch Info", for: .normal)
        btn.backgroundColor = SColors.btnGoToInfoDetail
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        
        return btn
    }()
    var carousel: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        var carousel = UICollectionView(frame: .zero, collectionViewLayout: layout)
        carousel.showsHorizontalScrollIndicator = false
        
        return carousel
    }()
    var itemFocusCarousel: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        var itemFocusCarousel = UICollectionView(frame: .zero, collectionViewLayout: layout)
        itemFocusCarousel.showsHorizontalScrollIndicator = false
        itemFocusCarousel.backgroundColor = .clear
        
        return itemFocusCarousel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    init(ship: EstrellaDeLaMuerte){
        self.ship = ship
        super.init(nibName: nil, bundle: nil)
    }
    
    func initUI(){
        
        view.addSubview(viewParent)
        viewParent.addAnchors(left: 20, top: 60, right: 20, bottom: 20)
        
        backImage.addTarget(self, action: #selector(regresarPage), for: .touchUpInside)
        viewParent.addSubview(backImage)
        backImage.addAnchorsAndSize(width: 20, height: 20, left: 10, top: 10, right: nil, bottom: nil)
        
        missionName.text = ship.mission_name
        viewParent.addSubview(missionName)
        missionName.addAnchors(left: 0, top: 10, right: 0, bottom: nil)
        
        detailText.text = "Details"
        viewParent.addSubview(detailText)
        detailText.addAnchors(left: 10, top: 65, right: nil, bottom: nil)
        
        let launchDate = Date(timeIntervalSince1970: Double(ship.launch_date_unix!))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let formattedDate = dateFormatter.string(from: launchDate)
        dateShip.text = "Date: \(formattedDate)"
        viewParent.addSubview(dateShip)
        dateShip.addAnchors(left: 10, top: 10, right: nil, bottom: nil, withAnchor: .top, relativeToView: detailText)
        
        siteShip.text = "Site: \(ship.launch_site!.site_name_long!)"
        viewParent.addSubview(siteShip)
        siteShip.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: dateShip)
        
        rocketNameShip.text = "Rocket name: \(ship.rocket!.rocket_name!)"
        viewParent.addSubview(rocketNameShip)
        rocketNameShip.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: siteShip)
        
        rocketTypeShip.text = "Rocket type: \(ship.rocket!.rocket_type!)"
        viewParent.addSubview(rocketTypeShip)
        rocketTypeShip.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: rocketNameShip)
        
        carousel.dataSource = self
        carousel.delegate = self
        carousel.register(ImageShipsCollectionViewCell.self, forCellWithReuseIdentifier: "images")
        viewParent.addSubview(carousel)
        carousel.addAnchorsAndSize(width: nil, height: 120, left: 10, top: 30, right: 10, bottom: nil, withAnchor: .top, relativeToView: rocketTypeShip)
        
        itemFocusCarousel.dataSource = self
        itemFocusCarousel.delegate = self
        itemFocusCarousel.register(ItemSelectedCollectionViewCell.self, forCellWithReuseIdentifier: "marker")
        viewParent.addSubview(itemFocusCarousel)
        itemFocusCarousel.addAnchorsAndSize(width: nil, height: 6, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: carousel)
        
        descriptionShip.text = ship.details ?? ""
        viewParent.addSubview(descriptionShip)
        descriptionShip.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: itemFocusCarousel)
        
        if !ship.links!.youtube_id!.isEmpty {
            viewParent.addSubview(btnPlayVideo)
            btnPlayVideo.addAnchorsAndSize(width: 44, height: 44, left: 40, top: 15, right: nil, bottom: nil, withAnchor: .top, relativeToView: descriptionShip)
            
            viewParent.addSubview(btnYoutubeVideo)
            btnYoutubeVideo.addAnchorsAndSize(width: nil, height: 44, left: 118, top: 15, right: 30, bottom: nil, withAnchor: .top, relativeToView: descriptionShip)
            
            btnPlayVideo.addTarget(self, action:#selector(goToVideo), for: .touchUpInside)
            btnYoutubeVideo.addTarget(self, action:#selector(goToVideo), for: .touchUpInside)
        }
        
        viewParent.addSubview(btnInfo)
        btnInfo.addAnchorsAndSize(width: 44, height: 44, left: 40, top: 15, right: nil, bottom: nil, withAnchor: .top, relativeToView: btnPlayVideo)
        
        viewParent.addSubview(btnLaunchInfo)
        btnLaunchInfo.addAnchorsAndSize(width: nil, height: 44, left: 118, top: 15, right: 30, bottom: nil, withAnchor: .top, relativeToView: btnPlayVideo)
        
        btnInfo.addTarget(self, action:#selector(goToInfo), for: .touchUpInside)
        btnLaunchInfo.addTarget(self, action:#selector(goToInfo), for: .touchUpInside)
              
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToInfo(){
        let viewController = ArticleViewController(linkArticle: ship.links!.article_link!)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func goToVideo(){
        let viewController = VideoViewController(linkVideo: ship.links!.video_link!, idVideo: ship.links!.youtube_id!)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    @objc func regresarPage(){
        dismiss(animated: true)
    }
}

extension DetailShipViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(ship.links!.flickr_images!.count)
        return ship.links!.flickr_images!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "images", for: indexPath) as! ImageShipsCollectionViewCell
            cell.initUI(image: ship.links!.flickr_images![indexPath.item])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marker", for: indexPath) as! ItemSelectedCollectionViewCell
            if itemFocusMarker == indexPath.item{
                cell.initUI(itemVisible: true)
            }else{
                cell.initUI(itemVisible: false)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carousel{
            return CGSize(width: width - 40, height: 120)
        }else{
            return CGSize(width: 6, height: 6)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == carousel {
            // Obtiene el índice de la celda actualmente visible
            let visibleRect = CGRect(origin: carousel.contentOffset, size: carousel.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let indexPath = carousel.indexPathForItem(at: visiblePoint) {
                let focusedItem = indexPath.item
                print("Elemento visible en el índice: \(focusedItem)")
                // Realiza las acciones que necesites con el índice de la celda actualmente visible
                itemFocusMarker =  focusedItem
                itemFocusCarousel.reloadItems(at: [indexPath])
            }
        }
    }
}
