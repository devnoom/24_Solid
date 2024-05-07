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
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = MainPageViewController()
        window?.makeKeyAndVisible()
        
    }
    
    
}
