//
//  TabBarVC.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/8.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

import UIKit

class TabBarVC: UITabBarController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var freshLaunch = true

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        setTabBarItems()
        self.title = "電話記錄"
        tabBar.barTintColor = UIColor(red: 0, green: 119/225, blue: 1, alpha: 1)
        tabBar.isTranslucent = false
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "more"), style: .done, target: self, action: #selector(didTapMoreButton))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        if let items = tabBar.items {
            for tabBarItem in items{
                tabBarItem.title = ""
                tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1
            self.title = "聯絡人"
        }
    }
    
    override func viewDidLayoutSubviews() {
        let navHeight = UINavigationBar().frame.height
//        let statusHeight = UIApplication.shared.statusBarFrame.height
        let statusHeight: CGFloat = 0
        tabBar.frame = CGRect(x: 0,y: navHeight + statusHeight, width: UIScreen.main.bounds.width, height: 50)
        self.view.frame = CGRect(x: 0, y: navHeight + 50, width: self.view.frame.width, height: self.view.frame.height)
        
    }

    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "tab1_icon_unsel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "tab1_icon_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.title = "電話記錄"
        //        myTabBarItem1.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "tab2_icon_unsel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: "tab2_icon_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.title = "聯絡人"
        //        myTabBarItem2.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "tab3_icon_unsel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.selectedImage = UIImage(named: "tab3_icon_sel")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.title = "我的最愛"
   
    }
    
    @objc func didTapMoreButton() {
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // 設定遠端資料來源
        let setting = UIAlertAction(title: "設定遠端資料來源", style: .default) { (_) in
            let alert = UIAlertController(title: "檢視資料來源", message: nil, preferredStyle: .alert)
            alert.addTextField { (textField) in
                textField.text = APIManager.shared.dataUrl
            }
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: { [weak alert] (_) in
                if let textField = alert?.textFields![0] {
                    APIManager.shared.dataUrl = textField.text ?? APIManager.shared.dataUrl
                }
            }))
            alert.addAction(UIAlertAction(title: "取消", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        // 更新資料集
        let update = UIAlertAction(title: "更新資料集", style: .default) { (_) in
            APIManager.shared.getCustomer { (isSucceed, _cusData) in
                if isSucceed {
                    if SQLiteManager.shared.cleanCustomTable() { print("cleanCustomTable成功  ") }
                        guard let datas = _cusData else { print("更新Customer失敗"); return }
                        var succeedCount = 0
                        var failedCount = 0
                        for data in datas {
                            if SQLiteManager.shared.insertCustomInfo(data) {
                                succeedCount += 1
                                print("更新Customer成功\(succeedCount)")
                            }else {
                                failedCount += 1
                                print("更新Customerd失敗\(failedCount)")
                            }
                        }
                }
            }
            APIManager.shared.getEmployee { (isSucceed, _empData) in
                if isSucceed {
                    if SQLiteManager.shared.cleanEmployeeTable() { print("cleanEmployeeTable成功") }
                        guard let datas = _empData else { print("更新Employee失敗"); return }
                        var succeedCount = 0
                        var failedCount = 0
                        for data in datas {
                            if SQLiteManager.shared.insertEmployeeInfo(data) {
                                succeedCount += 1
                                print("更新Employee成功\(succeedCount)")
                            }else {
                                failedCount += 1
                                print("更新Employee失敗\(failedCount)")
                            }
                        }
                }
            }
            APIManager.shared.getSupplier { (isSucceed, _supData) in
                if isSucceed {
                    if SQLiteManager.shared.cleanSupplierTable() { print("cleanSupplierTable成功") }
                        guard let datas = _supData else { print("更新Supplier失敗"); return }
                        var succeedCount = 0
                        var failedCount = 0
                        for data in datas {
                            if SQLiteManager.shared.insertSupplierInfo(data) {
                                succeedCount += 1
                                print("更新Supplier成功\(succeedCount)")
                            }else {
                                failedCount += 1
                                print("更新Supplier失敗\(failedCount)")
                            }
                        }
                }
            }
        }
        // 排序資料集
        let sort = UIAlertAction(title: "排序資料集", style: .default) { (_) in
            
        }
        
        alertSheet.addAction(setting)
        alertSheet.addAction(update)
        alertSheet.addAction(sort)
        alertSheet.addAction(UIAlertAction(title: "取消", style: .destructive, handler: nil))
        self.presentAlertSheet(alertSheet, animated: true)
    }
    
}

extension TabBarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        print("tabBarIndex: \(tabBarIndex)")
        switch tabBarIndex {
        case 0:
            self.title = "電話記錄"
        case 1:
            self.title = "聯絡人"
        case 2:
            self.title = "我的最愛"
        default:
            self.title = "電話記錄"
        }
    }
}

extension UIViewController {
    func presentAlertSheet(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad ){
            if let currentPopoverpresentioncontroller = viewControllerToPresent.popoverPresentationController{
                currentPopoverpresentioncontroller.sourceView = self.view
                currentPopoverpresentioncontroller.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                currentPopoverpresentioncontroller.permittedArrowDirections = []
                self.present(viewControllerToPresent, animated: true, completion: nil)
            }
        }else{
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
}
