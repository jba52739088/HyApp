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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showLoginView))
        self.backgroungImg.addGestureRecognizer(tapGesture)
        self.backgroungImg.isUserInteractionEnabled = true
    }
    
    @objc func showLoginView() {
        APIManager.shared.login(account: "admin", password: "123456") { (_, _) in
            //
        }
    }


}

