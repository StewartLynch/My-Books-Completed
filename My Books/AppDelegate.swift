//
//  AppDelegate.swift
//  My Books
//
//  Created by Stewart Lynch on 2021-09-03.
//  Copyright © 2021 Stewart Lynch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navBarAppearance = UINavigationBar.appearance()
        if #available(iOS 13.0, *) {
            // Handles Dark Mode for iOS 13
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor.systemBackground
            navBarAppearance.standardAppearance = appearance
            navBarAppearance.compactAppearance = appearance
            navBarAppearance.scrollEdgeAppearance = appearance
        } else {
            navBarAppearance.isTranslucent = true
        }
        return true
    }


}

