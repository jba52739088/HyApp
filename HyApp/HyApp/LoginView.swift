//
//  LoginView.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/7.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak var accField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var idSwitch: UISwitch!
    @IBOutlet weak var appearSwitch: UISwitch!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loginBtn.layer.cornerRadius = 5
        self.loginBtn.layer.masksToBounds = true
        self.loginBtn.clipsToBounds = true
        self.cancelBtn.layer.cornerRadius = 5
        self.cancelBtn.layer.masksToBounds = true
        self.cancelBtn.clipsToBounds = true
    }

}
