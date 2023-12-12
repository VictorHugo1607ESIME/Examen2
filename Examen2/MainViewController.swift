//
//  MainViewController.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 29/11/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        let manager = NetworkManager()
        manager.getListSpaceCraft()
        manager.delegate = self
    }
    
    func initUI(shipList: [EstrellaDeLaMuerte]){
        print("Iniciando MainViewController")
        let shipsView = ShipsView(ships: shipList)
        view.addSubview(shipsView)
        shipsView.addAnchors(left: 15, top: 60, right: 15, bottom: 30)
        shipsView.delegate = self
    }

}

extension MainViewController: NetworkManagerDelegate, ShipViewDelegate{
    
    func responseSucess(response: [EstrellaDeLaMuerte]) {
        initUI(shipList: response)
    }
    
    func responseError(error: Error) {
        print("Error::: \(error)")
    }
    
    func shipSelected(ship: EstrellaDeLaMuerte) {
        print("ship selected")
        let viewController = DetailShipViewController(ship: ship)
       // navigationController?.present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}
