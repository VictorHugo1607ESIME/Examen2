//
//  MainCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import UIKit

class MainCoordinator:Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = MainViewController()
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.setViewControllers([view], animated: true)
    }
    
    func connectShipDetail(ship: EstrellaDeLaMuerte){
        let detailShipCoordinator = DetailShipCoordinator(navigationController: navigationController)
        detailShipCoordinator.ship = ship
        childCoordinator.append(detailShipCoordinator)
        detailShipCoordinator.startCoordinator()
    }
}
