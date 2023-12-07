//
//  NetworkManager.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 29/11/23.
//

import Foundation

protocol NetworkManagerDelegate{
    func responseSucess(response : [EstrellaDeLaMuerte])
    func responseError( error: Error)
}

class NetworkManager: NSObject, URLSessionDelegate, URLSessionDataDelegate{
    
    var delegate : NetworkManagerDelegate?
    
    func getListSpaceCraft(){
        let urlString = "https://api.spacexdata.com/v3/launches/past" //URL en String
        let url = URL(string: urlString)! //Aquí estamos creando nuestro objeto de tipo URL
        
        let sessionConfiguration = URLSessionConfiguration.default //Creamos la configuración de nuestra session
        let defaultSession = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        
        let task = defaultSession.dataTask(with: request){ [self] data, response, error in
            
            //print("DATA::: \(data)")
            //print("RESPONSE::: \(response)")
            //print("ERROR::: \(error)")
            
            if let error = error{
                delegate?.responseError(error: error)
                
            }else {
                if let data = data{
                    let json = String(data: data, encoding: .utf8)
                    do{
                        let shipsObject = try JSONDecoder() .decode([EstrellaDeLaMuerte].self, from: data)
                        print("Se convirtio exitosamente el objeto")
                        delegate?.responseSucess(response: shipsObject)
                        print("\(shipsObject[0])")
                    }catch{
                        print("Error catch::: \(error)")
                        delegate?.responseError(error: error)
                    }
                    
                }
            }
        }
        task.resume() //Aquí cerramos nuestro Task
    }
    
}
