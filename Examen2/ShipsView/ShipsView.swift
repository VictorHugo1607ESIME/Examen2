//
//  ShipsView.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 30/11/23.
//

import UIKit
protocol ShipViewDelegate{
    func shipSelected(ship: EstrellaDeLaMuerte)
}

class ShipsView: UIView {
    
    var title : UILabel = {
        var titulo = UILabel()
        titulo.textColor = .black
        titulo.text = "Space X :cohete:"
        titulo.font = UIFont(name: "Arial Bold", size: 15)
        return titulo
    }()
    var subtitle: UILabel = {
        var subtitulo = UILabel()
        subtitulo.textColor = .black
        subtitulo.text = "Launches Past"
        subtitulo.font = UIFont(name: "Arial bold", size: 25)
        return subtitulo
    }()
    var delegate : ShipViewDelegate?
    var shipCollection: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        var collecion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collecion
    }()
    
    var ships: [EstrellaDeLaMuerte]?
    
    init(ships:[EstrellaDeLaMuerte]){
        self.ships = ships
        super.init(frame: .zero)
        initUI()
    }
    
    func initUI(){
        
        self.backgroundColor = SColors.backgroundDetail
        self.addSubview(title)
        title.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: nil, top: 15, right: nil, bottom: nil)
        
        self.addSubview(subtitle)
        subtitle.addAnchors(left: 5, top: 25, right: nil, bottom: nil, withAnchor: .bottom, relativeToView: title)
        
        shipCollection.dataSource = self
        shipCollection.delegate = self
        shipCollection.register(ShipCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        shipCollection.backgroundColor = .white
        self.addSubview(shipCollection)
        shipCollection.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 5, top: 50, right: 5, bottom: 60)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ShipsView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (ships?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShipCollectionViewCell
        cell.initUI(ship: ships![indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (width - 40) / 1, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate!.shipSelected(ship: ships![indexPath.item])
    }
    
}
