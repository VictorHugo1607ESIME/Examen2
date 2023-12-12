//
//  ItemSelectedCollectionViewCell.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 11/12/23.
//

import UIKit

class ItemSelectedCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .gray
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    
    func initUI(itemVisible: Bool){
        if itemVisible{
            itemIsVisible()
        }
    }
    
    func itemIsVisible(){
        self.backgroundColor = SColors.textBlueDetail
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
