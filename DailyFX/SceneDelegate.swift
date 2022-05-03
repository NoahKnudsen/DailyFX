//
//  SceneDelegate.swift
//  DailyFX
//
//  Created by Noah Knudsen on 03/05/2022.
//

import UIKit
import Foundational

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = with(UIWindow(windowScene: windowScene)) { window in
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
        }
    }
}
