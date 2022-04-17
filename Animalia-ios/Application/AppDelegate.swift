//
//  AppDelegate.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 23/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let initialViewController = UINavigationController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }
        
        initialViewController.setRootWireframe(RoleWireframe())
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        return true
    }
}
