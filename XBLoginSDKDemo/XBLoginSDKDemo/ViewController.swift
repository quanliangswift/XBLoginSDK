//
//  ViewController.swift
//  XBLoginSDKDemo
//
//  Created by 全尼古拉斯 on 2021/5/25.
//

import UIKit
import XBLoginSDK
import GoogleSignIn
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func onclickInit(_ sender: Any) {
        XBLoginSDKManager.shared.startSDK(appId: "b3754e555fd58101df831b9e8e95f1cf8c968024", sign: GIDSignIn.sharedInstance())
    }
    
    
    @IBAction func onclickLogin(_ sender: Any) {
        XBLoginSDKManager.shared.show(vc: self) { result in
            print("login result", result.rawValue)
            if result == .success {
                
            }
        }
    }
    
    @IBAction func onclickLogout(_ sender: Any) {
        XBLoginSDKManager.shared.logout { result in
            print("logout result", result.rawValue)
            if result == .success {
                
            }
        }
    }
    
    @IBAction func onclickEncharge(_ sender: Any) {
        RechargeController.showRechargeController(fromVC: self)
    }
}
