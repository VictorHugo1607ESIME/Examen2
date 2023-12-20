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
    
    func returnPage(){
        navigationController.popViewController(animated: true)
    }
    
    func connectToArticle(linkArtile: String){
        let articleCoordinator = ArticleCoordinator(navigationController: navigationController)
        articleCoordinator.linkArticle = linkArtile
        childCoordinator.append(articleCoordinator)
        articleCoordinator.startCoordinator()
    }
    
    func connectToVideo(linkVideo: String, idVideo: String){
        let videoCoordinator = VideoCoordinator(navigationController: navigationController)
        videoCoordinator.linkVideo = linkVideo
        videoCoordinator.idVideo = idVideo
        childCoordinator.append(videoCoordinator)
        videoCoordinator.startCoordinator()
    }
}
