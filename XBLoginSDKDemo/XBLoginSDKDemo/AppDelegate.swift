//
//  AppDelegate.swift
//  XBLoginSDKDemo
//
//  Created by 全尼古拉斯 on 2021/5/25.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        GIDSignIn.sharedInstance().clientID = "300760974892-4od5r59ug4d7v2dovgq81r45503t14hm.apps.googleusercontent.com"
            
        return true
    }

    
    
    func application( _ app:UIApplication, open url:URL, options: [UIApplication.OpenURLOptionsKey :Any] = [:] ) -> Bool {
        ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
        
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
            var result = false
            
            if result == false {
                result = ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation
                )
            }
            if result == false {
                GIDSignIn.sharedInstance().handle(url)
            }
        return result
    }

}

