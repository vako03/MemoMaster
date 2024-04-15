//
//  SceneDelegate.swift
//  MemoMaster
//
//  Created by vako on 13.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

      func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
          
          guard let windowScene = (scene as? UIWindowScene) else { return }
          window = UIWindow(windowScene: windowScene)
          
          let splashViewController = SplashViewController()
          window?.rootViewController = splashViewController
          window?.makeKeyAndVisible()
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
              guard let self = self else { return }
              let viewController = OnboardingViewController()
              let navigationController = UINavigationController(rootViewController: viewController)
              self.window?.rootViewController = navigationController
          }
      }
  }
