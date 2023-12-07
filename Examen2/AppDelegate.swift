//
//  AppDelegate.swift
//  Examen2
//
//  Created by Victor Hugo Martinez Ramirez on 29/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController(rootViewController: SplashScreenViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }



}

