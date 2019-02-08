//
//  LoginView.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/7.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func doRemeberID(_ remeber: Bool)
    func tapLogin(acc: String, pwd: String)
    func tapCancel()
}

class LoginView: UIView {

    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var accField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var idSwitch: UISwitch!
    @IBOutlet weak var appearSwitch: UISwitch!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var delegate: LoginViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loginBtn.layer.cornerRadius = 5
        self.loginBtn.layer.masksToBounds = true
        self.loginBtn.clipsToBounds = true
        self.cancelBtn.layer.cornerRadius = 5
        self.cancelBtn.layer.masksToBounds = true
        self.cancelBtn.clipsToBounds = true
        self.idSwitch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        self.appearSwitch.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
        self.idSwitch.tag = 0
        self.appearSwitch.tag = 1
    }
    
    @IBAction func tapSwitch(_ sender: UISwitch) {
        if sender.tag == 0 {
            if sender.isOn {
                self.delegate.doRemeberID(true)
            }else {
                self.delegate.doRemeberID(false)
            }
        }else {
            UserDefaults.standard.set(sender.isOn, forKey: HY_SHOW)
            UserDefaults.standard.synchronize()
            if sender.isOn {
                self.pwdField.isSecureTextEntry = false
            }else {
                self.pwdField.isSecureTextEntry = true
            }
        }
    }
    

    @IBAction func doLogin(_ sender: Any) {
        if let account = self.accField.text,
            let password = self.pwdField.text {
            self.delegate.tapLogin(acc: account, pwd: password)
        }
    }
    
    
    @IBAction func doCancel(_ sender: Any) {
        self.delegate.tapCancel()
    }
}
