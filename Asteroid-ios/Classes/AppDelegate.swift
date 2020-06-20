//
//  AppDelegate.swift
//  Asteroid-ios
//
//  Created by 陈潇炜 on 2020/6/17.
//  Copyright © 2020 陈潇炜. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let v = ViewController()
        window?.rootViewController = v
        window?.makeKeyAndVisible()

        return true
    }

}

