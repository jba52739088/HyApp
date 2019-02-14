//
//  ContactListVC.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/10.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class ContactListVC: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var typeBtn: UIButton!
    
    private var didSortType = "全部"
    var customerData: [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configSearchBar()
        self.configTableView()
        
        self.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let navHeight = UINavigationBar().frame.height
        self.view.frame = CGRect(x: 0, y: navHeight + 50, width: self.view.frame.width, height: self.view.frame.height - 50)
    }
    
    @IBAction func didTapTypeBtns(_ sender: Any) {
        let types = ["全部", "編號", "名稱", "聯絡人", "電話", "手機", "地址", "備註"]
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for item in types {
            let typeAction = UIAlertAction(title: item, style: .default) { (_) in
                self.typeBtn.setTitle(item, for: .normal)
                self.didSortType = item
                self.shouldSortByType()
            }
            alertSheet.addAction(typeAction)
        }
        self.presentAlertSheet(alertSheet, animated: true)
    }
    
    func configTableView() {
        tableView.register(UINib(nibName: "ContactListCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.layoutSubviews()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func configSearchBar() {
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        for subView in searchBar.subviews {
            for subViewOne in subView.subviews {
                if let _ = subViewOne as? UITextField {
                    subViewOne.backgroundColor = UIColor.white
                }
            }
        }
    }
    
    func loadData() {
        APIManager.shared.getSupplier { (isSucceed, Data) in
            //
        }
    }
    
    func shouldSortByType() {
        self.tableView.reloadData()
    }
}

extension ContactListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ContactListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //
    }
}
