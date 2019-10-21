//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by youngjun goo on 2019/10/21.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var launchedShortcutItem: UIApplicationShortcutItem?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShorCutItem = handleShortCutItem(shortcutItem)
        completionHandler(handledShorCutItem)
    }
    
    // shortcut 제어  메서드
    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        
        guard let _ = ShortcutIdentifier(fullType: shortcutItem.type) else {
            return false
        }
        
        guard let shortCutType = shortcutItem.type as String? else {
            return false
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        
        switch shortCutType {
        case ShortcutIdentifier.First.type:
            vc = storyboard.instantiateViewController(identifier: "AscVC") as! AscViewController
            handled = true
        case ShortcutIdentifier.First.type:
            vc = storyboard.instantiateViewController(identifier: "BscVC") as! BscViewController
            handled = true
        case ShortcutIdentifier.First.type:
            vc = storyboard.instantiateViewController(identifier: "CscVC") as! CscViewController
            handled = true
        default:
            vc = UIViewController()
            break
        }
        
        // 선택된 view를 dispaly
        guard var presentedVC: UIViewController = window?.rootViewController else {
            return false
        }
        while presentedVC.presentedViewController != nil {
            presentedVC = presentedVC.presentedViewController!
        }
        
        if !presentedVC.isMember(of: vc.classForCoder) {
            presentedVC.present(vc, animated: true, completion: nil)
        }
        
        return handled
        
    }
}

