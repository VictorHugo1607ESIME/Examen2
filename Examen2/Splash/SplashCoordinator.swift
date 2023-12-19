//
//  SplashCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import UIKit

class SplashCoordinator: Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationCoontroller: UINavigationController
    
    init(navigationCoontroller: UINavigationController) {
        self.navigationCoontroller = navigationCoontroller
    }
    
    func startCoordinator() {
        let view = SplashScreenViewController()
        let viewModel = splashViewModel()
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationCoontroller.setViewControllers([view], animated: true)
    }
    
    func connectToHome(){
        let mainCoordinator = MainCoordinator(navigationController: navigationCoontroller)
        childCoordinator.append(mainCoordinator)
        mainCoordinator.startCoordinator()
    }
}
