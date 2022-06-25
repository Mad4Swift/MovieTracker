//
//  AppDelegate.swift
//  myMovieTrackerApp
//
//  Created by Atakan Gedik on 23.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = MovieTrackerRootVC()
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }



}

