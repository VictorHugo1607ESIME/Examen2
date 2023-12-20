//
//  DetailShipViewModel.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 18/12/23.
//

import Foundation

class DetailShipViewModel{
    var coordinator: DetailShipCoordinator!
    var ship: EstrellaDeLaMuerte?
    
    func returnPage(){
        coordinator.returnPage()
    }
    
    func goToArticle(linkArticle: String){
        coordinator.connectToArticle(linkArtile: linkArticle)
    }
    
    func goToVideo(linkVideo: String, idVideo: String){
        coordinator.connectToVideo(linkVideo: linkVideo, idVideo: idVideo)
    }
}
