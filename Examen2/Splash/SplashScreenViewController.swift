//
//  SplashScreenViewController.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 29/11/23.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var viewModel: splashViewModel!

    var icon : UIImageView = {
        var icon = UIImageView()
        let image = UIImage(named: "nave")
        icon.image = image
        
        return icon
    }()
    
    var fondo : UIImageView = {
        var fondo = UIImageView()
        fondo.image = UIImage(named: "fondoP")
        return fondo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    }
    
    func initUI(){
        view.addSubview(fondo)
        fondo.addAnchorsWithMargin(0)
        view.addSubview(icon)
        icon.addAnchorsAndCenter(centerX: true, centerY: true, width: 50, height: 50, left: nil, top: nil, right: nil, bottom: nil)
        setUpTimer()
    }
    
    func setUpTimer(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goToMain), userInfo: nil, repeats: false)
    }
    
    @objc func goToMain(){
        //let viewController = MainViewController()
        //navigationController?.pushViewController(viewController, animated: true)
        viewModel.goToHome()
    }
}
