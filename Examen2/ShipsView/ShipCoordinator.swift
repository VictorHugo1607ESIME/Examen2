//
//  ShipCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import UIKit

class ShipCoordinator:Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController!) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        
    }
    
    
}
