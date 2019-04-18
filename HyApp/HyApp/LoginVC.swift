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
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var loginView: LoginView!
    var crashText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.idLabel.text = appDelegate.uuid
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
        self.versionLabel.text = "V" + (appVersion ?? "")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapBackGroundView))
        self.backgroungImg.addGestureRecognizer(tapGesture)
        self.backgroungImg.isUserInteractionEnabled = true
    }
    
    @objc func didTapBackGroundView() {
        APIManager.shared.checkUUID(uuid: self.appDelegate.uuid ?? "") { (isSucceed, errorMsg) in
            if isSucceed {
                self.showLoginView()
            }else {
                print("errorMsg: \(errorMsg)")
                let alert = UIAlertController(title: nil, message: "目前裝置停用本軟體中", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    self.idLabel.text = self.crashText!
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func showLoginView() {
        if loginView != nil {
            self.closeLoginView()
        }else {
            
            loginView = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)?.first as! LoginView
            loginView.delegate = self
            loginView.frame = self.view.frame
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.showLoginView))
            loginView.tapView.addGestureRecognizer(tapGesture)
            loginView.tapView.isUserInteractionEnabled = true
            self.view.addSubview(loginView)
            self.configLoginView()
        }
        
        //        APIManager.shared.login(account: "admin", password: "123456") { ( isSucceed, msg) in
//            if isSucceed {
//                print(thisUser?.account)
//            }
//        }
    }
    
    func configLoginView() {
        if UserDefaultsKeys.REMEBER {
            loginView.idSwitch.setOn(true, animated: false)
            loginView.accField.text = UserDefaultsKeys.ACCOUNT
            loginView.pwdField.text = UserDefaultsKeys.PASSWORD
        }else {
            loginView.appearSwitch.setOn(false, animated: false)
        }
        if UserDefaultsKeys.SHOW {
            loginView.appearSwitch.setOn(true, animated: false)
            loginView.pwdField.isSecureTextEntry = false
        }else {
            loginView.appearSwitch.setOn(false, animated: false)
            loginView.pwdField.isSecureTextEntry = true
        }
    }

    func closeLoginView() {
        if loginView != nil {
            loginView.removeFromSuperview()
            loginView = nil
        }
    }

}

extension LoginVC: LoginViewDelegate {
    func doRemeberID(_ remeber: Bool) {
        UserDefaults.standard.set(remeber, forKey: HY_REMEBER)
        UserDefaults.standard.synchronize()
        if !remeber {
            UserDefaults.standard.set("", forKey: HY_ACCOUNT)
            UserDefaults.standard.set("", forKey: HY_PASSWORD)
            UserDefaults.standard.synchronize()
        }
    }
    
    func tapLogin(acc: String, pwd: String) {
        self.closeLoginView()
        if UserDefaultsKeys.REMEBER {
            UserDefaults.standard.set(acc, forKey: HY_ACCOUNT)
            UserDefaults.standard.set(pwd, forKey: HY_PASSWORD)
            UserDefaults.standard.synchronize()
        }else {
            UserDefaults.standard.set("", forKey: HY_ACCOUNT)
            UserDefaults.standard.set("", forKey: HY_PASSWORD)
            UserDefaults.standard.synchronize()
        }
        let alert = UIAlertController(title: nil, message: "登入作業進行中...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        APIManager.shared.login(account: acc, password: pwd) { ( isSucceed, msg) in
            alert.dismiss(animated: true, completion: {
                if isSucceed {
                    APIManager.shared.getDataUrl(completionHandler: { (succeed, _msg) in
                        if succeed {
                            print("account: \(thisUser?.account ?? "")")
                            let tabVC = self.storyboard?.instantiateViewController(withIdentifier: "nav") as! UINavigationController
                            self.present(tabVC, animated: true, completion: nil)
                        }else {
                            
                        }
                    })
                }else {
                    let alert = UIAlertController(title: nil, message: "驗證失敗，無法登入", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "確認", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
    
    func tapCancel() {
        self.closeLoginView()
    }
    
    
}
