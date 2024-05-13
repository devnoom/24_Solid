//
//  SceneDelegate.swift
//  24_Solid
//
//  Created by MacBook Air on 08.05.24.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
           guard let windowScene = (scene as? UIWindowScene) else { return }
           let window = UIWindow(windowScene: windowScene)
           
           let viewModel = MainPageViewModel()
           let mainPageViewController = MainPageViewController(viewModel: viewModel)
           let navigationController = UINavigationController(rootViewController: mainPageViewController)
           
           window.rootViewController = navigationController
           self.window = window
           self.window?.makeKeyAndVisible()
       }
    
    
}
