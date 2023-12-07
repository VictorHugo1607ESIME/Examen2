import UIKit

class ShipCollectionViewCell: UICollectionViewCell {
    
    var arrowButton : UIImageView = {
        var arrow = UIImageView()
        arrow.image = UIImage(named: "arrow")
        arrow.tintColor = .black
        return arrow
    }()
    var viewBorder: UIView = {
        var viewBorder = UIView()
        viewBorder.layer.cornerRadius = 5
        viewBorder.layer.borderWidth = 3
        viewBorder.layer.borderColor = UIColor.gray.cgColor
        viewBorder.clipsToBounds = true
        return viewBorder
    }()
    var imagesShip: UIImageView = {
        var images = UIImageView()
        images.clipsToBounds = true
        return images
    }()
    var name: UILabel = {
        var name = UILabel()
        name.textColor = .black
        name.font = UIFont(name: "Arial Bold", size: 20)
        return name
    }()
    var siteName: UILabel = {
        var siteName = UILabel()
        siteName.textColor = .gray
        siteName.font = UIFont(name: "Arial", size: 13)
        return siteName
    }()
    var launchYear: UILabel = {
        var launchYear = UILabel()
        launchYear.textColor = .gray
        launchYear.font = UIFont(name: "Arial", size: 13)
        return launchYear
    }()
    
    //usar el ship para modificar
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func initUI(ship: EstrellaDeLaMuerte){
        
        self.addSubview(arrowButton)
        arrowButton.addAnchors(left: nil, top: nil, right: 5, bottom: 50)
        
        let cellWidth = (width - 40) / 1
        self.addSubview(viewBorder)
        viewBorder.addAnchorsAndSize(width: cellWidth, height: 130, left: nil, top: 5, right: nil, bottom: 5)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        imagesShip.sd_setImage(with: URL(string: ship.links!.mission_patch!))
        self.addSubview(imagesShip)
        imagesShip.addAnchorsAndSize(width: 180, height: nil, left: 20, top: 10, right: nil, bottom: 10)
        
        name.text = ship.mission_name
        self.addSubview(name)
        name.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: 10, top: 10, right: 100, bottom: nil, withAnchor: .left, relativeToView: imagesShip)
        
        //nombre del lugar de lanzamient
        siteName.text = ship.launch_site?.site_name
        self.addSubview(siteName)
        siteName.addAnchorsAndCenter(centerX: false, centerY: true, width: nil, height: nil, left: 10, top: nil, right: 10, bottom: nil, withAnchor: .left, relativeToView: imagesShip)
        
        //fecha de lanzamiento
        launchYear.text = ship.launch_year
        self.addSubview(launchYear)
        launchYear.addAnchorsAndCenter(centerX: false, centerY: false, width: nil, height: nil, left: 10, top: nil, right: 10, bottom: 10,withAnchor: .left, relativeToView: imagesShip )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








