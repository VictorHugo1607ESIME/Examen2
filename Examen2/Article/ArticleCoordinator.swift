//
//  ArticleCoordinator.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 19/12/23.
//

import UIKit


class ArticleCoordinator: Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController = UINavigationController()
    var linkArticle: String?
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let view = ArticleViewController()
        let viewModel = ArticleViewModel()
        viewModel.linkArticle = linkArticle
        viewModel.coordinator = self
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated:true)
    }
        
}
