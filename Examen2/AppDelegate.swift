
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.startCoordinator()
        
//        let navigationController = UINavigationController(rootViewController: SplashScreenViewController())
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
        
        return true
    }



}

