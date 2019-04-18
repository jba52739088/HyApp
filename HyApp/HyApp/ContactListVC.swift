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
    var customerDatas: [Customer] = []
    var supplierDatas: [Supplier] = []
    var employeeDatas: [Employee] = []
    var allDatas = Dictionary<Int, NSObject>()

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
        self.view.frame = CGRect(x: 0, y: navHeight + 50, width: self.view.frame.width, height: self.view.frame.height)
       
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
        SQLiteManager.shared.loadEmployeeInfo { (datas) in
            let sortedDara: [Employee] = datas.sorted{$0.EMPNO < $1.EMPNO}
            self.employeeDatas = sortedDara
            self.employeeDatas = datas
            for i in 0 ..< self.employeeDatas.count {
                self.allDatas[i] = self.employeeDatas[i]
            }
        }
        SQLiteManager.shared.loadSupplierInfo { (datas) in
            let sortedDara: [Supplier] = datas.sorted{$0.SUPPNO < $1.SUPPNO}
            self.supplierDatas = sortedDara
//            self.supplierDatas = datas
            for i in 0 ..< self.supplierDatas.count {
                self.allDatas[i + self.employeeDatas.count] = self.supplierDatas[i]
            }
        }
        SQLiteManager.shared.loadCustomInfo { (datas) in
            let sortedDara: [Customer] = datas.sorted{$0.custno < $1.custno}
            self.customerDatas = sortedDara
            //            self.supplierDatas = datas
            for i in 0 ..< self.customerDatas.count {
                self.allDatas[i + self.employeeDatas.count + self.supplierDatas.count] = self.customerDatas[i]
            }
        }
        self.tableView.reloadData()
    }
    
    func shouldSortByType() {
        self.tableView.reloadData()
    }
}

extension ContactListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allDatas.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ContactListCell
        let thisData = self.allDatas[indexPath.row]
        if (thisData is Employee) {
            guard let data = thisData as? Employee else { return UITableViewCell()}
            cell.nameLabel.text = data.EMPNAME
            cell.addrLabel.text = data.ADDRESS
            cell.tel_1_Label.text = data.TEL
            cell.tel_2_Label.text = data.ACTTEL
            cell.otherLabel.text = ""
            cell.abbrLabel.text = ""
            cell.noLabel.text = data.EMPNO
            cell.imgView.image = UIImage(named: "custtype_2")
            
        }else if (thisData is Supplier) {
            guard let data = thisData as? Supplier else { return UITableViewCell()}
            cell.nameLabel.text = data.SUPPNAME
            cell.addrLabel.text = data.COMPADDR
            cell.tel_1_Label.text = data.TEL1
            cell.tel_2_Label.text = data.TEL2
            cell.otherLabel.text = data.MEMO
            cell.abbrLabel.text = data.SUPPABBR
            cell.noLabel.text = data.SUPPNO
            cell.imgView.image = UIImage(named: "custtype_3")
        }else {
            guard let data = thisData as? Customer else { return UITableViewCell()}
            cell.nameLabel.text = data.custname
            cell.addrLabel.text = data.compaddr
            cell.tel_1_Label.text = data.tel1
            cell.tel_2_Label.text = data.tel2
            cell.otherLabel.text = data.memo
            cell.abbrLabel.text = data.custabbr
            cell.noLabel.text = data.custno
            cell.imgView.image = UIImage(named: "custtype_1")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.data = self.allDatas[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
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
