//
//  AppDelegate.swift
//  Agora_iOS
//
//  Created by Syed on 22/02/20.
//  Copyright © 2020 Syed. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        IQKeyboardManager.shared.enable = true
        checkSession()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func checkSession() {
        
        let date = UserDefaults.standard.object(forKey: "expiresOn") as? String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateFromString: Date? = dateFormatter.date(from: date!)
        print(dateFromString!)
        if dateFromString! > Date() {
            presentHome()
        } else {
           presentLogin()
        }
    }
    
    func presentHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DashboardViewController = storyboard.instantiateViewController(withIdentifier: "DashboardVC")
        self.window?.rootViewController = DashboardViewController
        self.window?.makeKeyAndVisible()
    }
    
    func presentLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC")
        self.window?.rootViewController = homeViewController
        self.window?.makeKeyAndVisible()
    }



}

