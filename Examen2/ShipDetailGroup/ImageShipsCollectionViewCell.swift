//
//  ImageShipsCollectionViewCell.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 06/12/23.
//

import UIKit
import SDWebImage
class ImageShipsCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView = {
        var image = UIImageView()
        
        return image
    }()
    
    override init(frame: CGRect){
        super.init(frame: .zero)
    }
    
    func initUI(image: String){
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        
        imageView.sd_setImage(with: URL(string: image))
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        imageView.addAnchorsWithMargin(0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
