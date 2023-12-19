//
//  MainViewModel.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import Foundation

class MainViewModel: NetworkManagerDelegate{
    var coordinator: MainCoordinator!
    var delegate: NetworkManagerDelegate!
    
    init(){
        let manager = NetworkManager()
        manager.getListSpaceCraft()
        manager.delegate = self
    }
    
    func connectDetailShipCoordinator(ship: EstrellaDeLaMuerte){
        coordinator.connectShipDetail(ship: ship)
    }
    
    func responseSucess(response: [EstrellaDeLaMuerte]) {
        delegate.responseSucess(response: response)
    }
    
    func responseError(error: Error) {
        print("Error::: \(error)")
    }
}
