//
//  FavoriteVC.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/17.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navHeight = UINavigationBar().frame.height
        self.view.frame = CGRect(x: 0, y: navHeight + 50, width: self.view.frame.width, height: self.view.frame.height)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
