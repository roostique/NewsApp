//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Rustem Supayev on 29/01/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabController()
//
//        let vc = MainTabController()
//        let nav = UINavigationController(rootViewController: vc)
//
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = nav
//        self.window?.makeKeyAndVisible()
        
        return true
    }


}

