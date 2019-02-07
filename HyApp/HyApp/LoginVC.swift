//
//  ViewController.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/2.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var backgroungImg: UIImageView!
    var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showLoginView))
        self.backgroungImg.addGestureRecognizer(tapGesture)
        self.backgroungImg.isUserInteractionEnabled = true
    }
    
    @objc func showLoginView() {
        if loginView != nil {
            loginView.removeFromSuperview()
            loginView = nil
        }else {
            loginView = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)?.first as! LoginView
            loginView.frame = self.view.frame
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showLoginView))
            loginView.addGestureRecognizer(tapGesture)
            loginView.isUserInteractionEnabled = true
            self.view.addSubview(loginView)
        }
        
        
//        APIManager.shared.login(account: "admin", password: "123456") { ( isSucceed, msg) in
//            if isSucceed {
//                print(thisUser?.account)
//            }
//        }
    }


}

