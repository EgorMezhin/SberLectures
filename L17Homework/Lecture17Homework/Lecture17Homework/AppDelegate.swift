//
//  AppDelegate.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gamesTabNavigationController : UINavigationController!
    var playersTabNavigationControoller : UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        gamesTabNavigationController = UINavigationController.init(rootViewController: GamesViewController())
        playersTabNavigationControoller = UINavigationController.init(rootViewController: PlayersViewController())
        
        tabBarController.viewControllers = [
            gamesTabNavigationController,
            playersTabNavigationControoller
        ]
        
        let item1 = UITabBarItem(
            title: "Games",
            image: UIImage(systemName: "list.bullet"),
            tag: 0)
        let item2 = UITabBarItem(
            title: "Players",
            image: UIImage(systemName: "person.3.fill"),
            tag: 1)
        
        gamesTabNavigationController.tabBarItem = item1
        playersTabNavigationControoller.tabBarItem = item2
        
        UITabBar.appearance().tintColor = UIColor(
            red: 0/255.0,
            green: 146/255.0,
            blue: 248/255.0,
            alpha: 1.0)
                
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

}

