//
//  SceneDelegate.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Variables And Declarations
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    // MARK: - Life cycle Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        setCoordinator(scene)
        
    }
    
    private func getRootController() -> UINavigationController {
        var viewController = UIStoryboard(name: Constants.Storybords.uiNavigationControl, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.getStartedVC)
        if UserDefaultHelper.isLogedIn {
            viewController = UIStoryboard(name: Constants.Storybords.uiNavigationControl, bundle: nil).instantiateViewController(withIdentifier: Constants.ViewController.userScreenVC)
        }
        return UINavigationController(rootViewController: viewController )
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
     func setCoordinator(_ scene: UIScene) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
            appWindow.windowScene = windowScene

            let navController = UINavigationController()
            appCoordinator = AppCoordinator(navigationController: navController)
            appCoordinator?.start()

            appWindow.rootViewController = navController
            appWindow.makeKeyAndVisible()

            window = appWindow
        }
}

