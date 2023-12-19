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
    
    var viewModel = ShipViewModel()
    
    var title : UILabel = {
        var titulo = UILabel()
        titulo.textColor = .black
        titulo.text = "Space X 🚀"
        titulo.font = UIFont(name: "Arial Bold", size: 15)
        titulo.textAlignment = .center
        return titulo
    }()
    var subtitle: UILabel = {
        var subtitulo = UILabel()
        subtitulo.textColor = SColors.textBlueDetail
        subtitulo.text = "Launches Past"
        subtitulo.font = UIFont(name: "Arial Bold", size: 25)
        subtitulo.textAlignment = .center
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
        title.addAnchorsAndSize(width: nil, height: 15, left: 0, top: 10, right: 0, bottom: nil)
        self.addSubview(subtitle)
        subtitle.addAnchorsAndSize(width: nil, height: 20, left: 5, top: 25, right: nil, bottom: nil,withAnchor: .top, relativeToView: title)
        shipCollection.dataSource = self
        shipCollection.delegate = self
        shipCollection.register(ShipCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        shipCollection.backgroundColor = .white
        self.addSubview(shipCollection)
        shipCollection.addAnchors(left: 5, top: 20, right: 5, bottom: 0, withAnchor: .top, relativeToView: subtitle)
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShipCollectionViewCell
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
