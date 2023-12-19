
import UIKit

protocol Coordinator{
    var childCoordinator: [Coordinator]{ get set }
    func startCoordinator()
}

class AppCoordinator: Coordinator{
    var childCoordinator: [Coordinator] = []
    var window: UIWindow
    
    init(window: UIWindow){
        self.window = window
    }
    
    func startCoordinator() {
        let navigationController = UINavigationController()
        let splashCoordinator = SplashCoordinator(navigationCoontroller: navigationController)
        childCoordinator.append(splashCoordinator)
        splashCoordinator.startCoordinator()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
