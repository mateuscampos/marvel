//
//  AppDelegate.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootController = UINavigationController()
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        self.appCoordinator = AppCoordinator(rootViewController: rootController)
        self.appCoordinator?.start()
        
        return true
    }

}
