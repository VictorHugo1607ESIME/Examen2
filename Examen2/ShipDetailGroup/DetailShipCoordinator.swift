//
//  DetailShipCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import UIKit

class DetailShipCoordinator: Coordinator{
    
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    var ship: EstrellaDeLaMuerte?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = DetailShipViewController()
        let viewModel = DetailShipViewModel()
        viewModel.ship = ship
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
    
    func startCoordinatorWithAttribute(ship: EstrellaDeLaMuerte) {
        
    }
    
    func returnPage(){
        navigationController.popViewController(animated: true)
    }
}
