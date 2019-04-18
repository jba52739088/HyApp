//
//  DetailVC.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/4/18.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // 1. 客戶 2. 廠商 3. 員工
    var dataType: Int = 1
    var data: AnyObject?
    var isFavirite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkDataInFavorite()
        self.tableView.tableFooterView = UIView()
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender.tag == 0 {
            self.tableView.isHidden = true
        }else {
            self.tableView.isHidden = false
        }
    }
    
    func checkDataInFavorite() {
        var id = ""
        var _type = ""
        switch self.dataType {
        case 1:
            guard let aCustomer = self.data as? Customer else { return }
            id = aCustomer.custno
            _type = "Customer"
        case 2:
            guard let aSupplier = self.data as? Supplier else { return }
            id = aSupplier.SUPPNO
            _type = "Supplier"
        case 3:
            guard let aEmployee = self.data as? Employee else { return }
            id = aEmployee.EMPNO
            _type = "Employee"
            
        default:
            print("checkDataInFavorite failed")
        }
        if SQLiteManager.shared.favoriteDataIsExist(id: id, type: _type) {
            isFavirite = true
        }else {
            isFavirite = false
        }
    }
    
}


extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.dataType {
        case 1:
            guard let aCustomer = self.data as? Customer else{ return UITableViewCell() }
            switch indexPath.section {
            case 0:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "nameCell") as! NameCell
                cell.lbTitle.text = "客戶名稱"
                cell.lbContent.text = aCustomer.custname
                return cell
            case 1:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "imgWithFourFieldCell") as! ImgWithFourFieldCell
                cell.lbTitle_1.text = "客戶編號"
                cell.lbTitle_2.text = "客戶簡稱"
                cell.lbTitle_3.text = "負責人"
                cell.lbTitle_4.text = "業務人員"
                cell.lbContent_1.text = aCustomer.custno
                cell.lbContent_2.text = aCustomer.custabbr
                cell.lbContent_3.text = aCustomer.boss
                cell.lbContent_4.text = aCustomer.empno
                cell.delegate = self
                if self.isFavirite {
                    cell.btnLike.setImage(UIImage(named: "like"), for: .normal)
                }else {
                    cell.btnLike.setImage(UIImage(named: "unlike"), for: .normal)
                }
                return cell
            case 2:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "電話1"
                cell.lbTitle_2.text = "傳真機"
                cell.lbContent_1.text = aCustomer.tel1
                cell.lbContent_2.text = aCustomer.fax
                return cell
            case 3:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "電話2"
                cell.lbTitle_2.text = "呼叫器"
                cell.lbContent_1.text = aCustomer.tel2
                cell.lbContent_2.text = aCustomer.bbc
                return cell
            case 4:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "imgWithTwoFieldCell") as! ImgWithTwoFieldCell
                cell.lbTitle_1.text = "聯絡人1"
                cell.lbTitle_2.text = "大哥大1"
                cell.lbContent_1.text = aCustomer.con1
                cell.lbContent_2.text = aCustomer.acttel1
                return cell
            case 5:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "imgWithTwoFieldCell") as! ImgWithTwoFieldCell
                cell.lbTitle_1.text = "聯絡人2"
                cell.lbTitle_2.text = "大哥大2"
                cell.lbContent_1.text = aCustomer.con2
                cell.lbContent_2.text = aCustomer.acttel2
                return cell
            case 6:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "統一編號"
                cell.lbTitle_2.text = "客戶類別"
                cell.lbContent_1.text = aCustomer.uniform
                cell.lbContent_2.text = aCustomer.ckindno
                return cell
            case 7:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "幣別編號"
                cell.lbTitle_2.text = "區域編號"
                cell.lbContent_1.text = aCustomer.priceclass
                cell.lbContent_2.text = aCustomer.areano
                return cell
            case 8:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "營業稅1"
                cell.lbTitle_2.text = "發票種類1"
                cell.lbContent_1.text = aCustomer.iksno
                cell.lbContent_2.text = aCustomer.taxkind
                return cell
            case 9:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "結帳類別"
                cell.lbContent.text = aCustomer.akindno
                return cell
            case 10:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "sevenBtnsCell") as! SevenBtnsCell
                cell.lbTitle.text = "售價取用"
                cell.radio_1.setTitle("建議售價", for: .normal)
                cell.radio_2.setTitle("歷史售價", for: .normal)
                cell.radio_3.setTitle("客戶等級折數", for: .normal)
                cell.radio_4.setTitle("類別等級折數", for: .normal)
                cell.radio_5.setTitle("類別折數", for: .normal)
                cell.radio_6.setTitle("均為零", for: .normal)
                cell.radio_7.setTitle("系統參數", for: .normal)
                return cell
            case 11:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "fiveBtnsCell") as! FiveBtnsCell
                cell.lbContent_2.layer.addBorder(edge: .bottom, color: UIColor.black, thickness: 1)
                cell.lbTitle.text = "售價等級"
                cell.radio_1.setTitle("售價1", for: .normal)
                cell.radio_2.setTitle("售價2", for: .normal)
                cell.radio_3.setTitle("售價3", for: .normal)
                cell.radio_4.setTitle("售價4", for: .normal)
                cell.radio_5.setTitle("售價5", for: .normal)
                cell.radio_6.setTitle("建議售價", for: .normal)
                cell.lbTitle_2.text = "折數"
                cell.lbContent_2.text = ""
                return cell
            case 12:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "公司地址"
                cell.lbContent.text = aCustomer.compaddr
                return cell
            case 13:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "發票地址"
                cell.lbContent.text = aCustomer.invoaddr
                return cell
            case 14:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "送貨地址"
                cell.lbContent.text = aCustomer.sendaddr
                return cell
            case 15:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "電子信箱"
                cell.lbContent.text = aCustomer.email
                return cell
            case 16:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "備註"
                cell.lbContent.text = aCustomer.memo
                return cell
            case 17:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "threeFieldCell") as! ThreeFieldCell
                cell.lbTitle_1.text = "請款對象"
                cell.lbTitle_2.text = "發票對象"
                cell.lbTitle_3.text = "結帳日"
                cell.lbContent_1.text = aCustomer.acustno
                cell.lbContent_2.text = aCustomer.icustno
                cell.lbContent_2.text = aCustomer.accday
                return cell
            case 18:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "twoFieldCell") as! TwoFieldCell
                cell.lbTitle_1.text = "信用額度"
                cell.lbTitle_2.text = "預收餘額"
//                cell.lbContent_1.text = aCustomer.iksno
//                cell.lbContent_2.text = aCustomer.taxkind
                return cell
            case 19:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "建檔日期"
                cell.lbContent.text = aCustomer.appedate2
                return cell
            case 20:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "自訂1"
                cell.lbContent.text = aCustomer.custud1
                return cell
            case 21:
                let cell = self.tableView.dequeueReusableCell(withIdentifier: "oneFieldCell") as! OneFieldCell
                cell.lbTitle.text = "自訂2"
                cell.lbContent.text = aCustomer.custud2
                return cell
            default:
                return UITableViewCell()
            }
        case 2:
            return UITableViewCell()
        case 3:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.dataType {
        case 1:
            switch indexPath.section {
            case 0, 2, 3, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20 ,21:
                return 35
            case 1, 4, 5, 10, 11:
                return 75
            default:
                return 0
            }
        case 2:
            return 0
        case 3:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}

extension DetailVC: ModifyFavoriteTypeDelegate {
    func onModifyFavoriteType() {
        var id = ""
        var type = ""
        switch self.dataType {
        case 1:
            guard let aCustomer = self.data as? Customer else { return }
            id = aCustomer.custno
            type = "Customer"
        case 2:
            guard let aSupplier = self.data as? Supplier else { return }
            id = aSupplier.SUPPNO
            type = "Supplier"
        case 3:
            guard let aEmployee = self.data as? Employee else { return }
            id = aEmployee.EMPNO
            type = "Employee"
        default:
            print("onModifyFavoriteType type error")
        }
        if self.isFavirite {
            // 刪除最愛
            if !SQLiteManager.shared.deleteFavoriteInfo(id: id, type: type) {
                print("deleteFavoriteInfo failed")
            }
        }else {
            // 新增最愛
            if !SQLiteManager.shared.insertFavoriteInfo(id: id, type: type, no: id) {
                print("deleteFavoriteInfo failed")
            }
        }
        self.isFavirite = !self.isFavirite
        self.tableView.reloadData()
    }
}
