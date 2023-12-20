//
//  VideoCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 19/12/23.
//

import UIKit

class VideoCoordinator: Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController = UINavigationController()
    var linkVideo: String?
    var idVideo: String?
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = VideoViewController()
        let viewModel = VideoViewModel()
        viewModel.linkVideo = self.linkVideo
        viewModel.idVideo = self.idVideo
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
}
