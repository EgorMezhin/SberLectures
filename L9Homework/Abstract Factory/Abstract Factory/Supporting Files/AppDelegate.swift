//
//  AppDelegate.swift
//  Abstract Factory
//
//  Created by Egor Lass on 19.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let mainView = MainViewController(nibName: nil, bundle: nil)
        navigationController.viewControllers = [mainView]
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        // Override point for customization after application launch.
        return true
    }


}

