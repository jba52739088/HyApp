//
//  APIManager.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/7.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON


var thisAccount = ""
var thisPassword = ""

class APIManager {
    
    
    static private var _shared: APIManager?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var uuid = ""
    var loginDomain = ""
    var source = ""
    var dataUrl = ""
    
    
    static var shared: APIManager! {
        if _shared == nil {
            _shared = APIManager()
        }
        return _shared
    }
    
    /// 登入
    func login(account: String, password: String, completionHandler: @escaping (_ status: Bool, _ message: String) -> Void){
        print("login: \(self.loginDomain + CK_ACCOUNT)")
        let parameters = ["account": account, "passwd": password] as [String : Any]
        Alamofire.request(self.loginDomain + CK_ACCOUNT, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                if let JSON = response.result.value as? [String:AnyObject] {
                    //                    print("JSON: \(JSON)")
                    if let result = JSON["result"] as? String {
                        if result == "true" {
                            if let data = JSON["data"] as? [String:AnyObject]{
                                if let id = data["id"] as? String,
                                    let account = data["account"] as? String,
                                    let passwd = data["passwd"] as? String,
                                    let phone = data["phone"] as? String,
                                    let name = data["name"] as? String,
                                    let corpname = data["corpname"] as? String,
                                    let email = data["email"] as? String,
                                    let imei = data["imei"] as? String,
                                    let memo1 = data["memo1"] as? String,
                                    let memo2 = data["memo2"] as? String,
                                    let status1 = data["status1"] as? String,
                                    let status2 = data["status2"] as? String,
                                    let dataurl = data["dataurl"] as? String,
                                    let source = data["source"] as? String{
                                    
                                    let user = User(id: id, account: account, passwd: passwd, phone: phone, name: name, corpname: corpname, email: email, imei: imei, memo1: memo1, memo2: memo2, status1: status1, status2: status2, dataurl: dataurl, source: source)
                                    thisUser = user
                                    self.source = source
                                    completionHandler(true, "login succeed")
                                    return
                                }
                            }
                        }else {
                            completionHandler(false, "login failed")
                            return
                        }
                        
                    }
                }
                print("login: get JSON error")
                completionHandler(false, "login: get JSON error")
        }
    }
    
    /// 檢查uuid
    func checkUUID(uuid: String, completionHandler: @escaping (_ status: Bool, _ message: String) -> Void){
        self.uuid = uuid
        let parameters = ["uuid": uuid] as [String : Any]
        Alamofire.request(CK_UUID, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                if let JSON = response.result.value as? [String:AnyObject] {
                    //                    print("JSON: \(JSON)")
                    if let result = JSON["result"] as? String,
                        let data = JSON["data"] as? [String:AnyObject],
                        let loginurl = data["loginurl"] as? String{
                        if result == "true" {
                            self.loginDomain = loginurl
                            completionHandler(true, "login failed")
                            return
                        }else {
                            completionHandler(false, "checkUUID failed")
                            return
                        }
                        
                    }
                    return
                }
                print("login: get JSON error")
                completionHandler(false, "checkUUID: get JSON error")
        }
    }

    /// 登入
    func getDataUrl(completionHandler: @escaping (_ status: Bool, _ message: String) -> Void){
        let parameters = ["uuid": self.uuid, "source": self.source] as [String : Any]
        Alamofire.request(GET_SOURCE, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                if let JSON = response.result.value as? [String:AnyObject] {
                    //                    print("JSON: \(JSON)")
                    if let result = JSON["result"] as? String {
                        if result == "true" {
                            if let data = JSON["data"] as? [String:AnyObject]{
                                if let id = data["id"] as? String,
//                                    let account = data["uuid"] as? String,
//                                    let phone = data["phone"] as? String,
//                                    let name = data["username"] as? String,
//                                    let status1 = data["status1"] as? String,
//                                    let status2 = data["status2"] as? String,
//                                    let source = data["loginurl"] as? String,
                                    let dataurl = data["dataurl"] as? String{
                                   
                                    self.dataUrl = dataurl
                                    completionHandler(true, "getDataUrl succeed")
                                    return
                                }
                            }
                        }else {
                            completionHandler(false, "getDataUrl failed")
                            return
                        }
                        
                    }
                }
                print("getDataUrl: get JSON error")
                completionHandler(false, "login: get JSON error")
        }
    }
/// 取顧客
func getCustomer(completionHandler: @escaping (_ status: Bool, _ data: [Customer]?) -> Void){
    //        if dataUrl == "" { return }
    print("getCustomer: \(dataUrl + GET_CUSTOMER)")
    Alamofire.request(dataUrl + GET_CUSTOMER, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
//            print("getCustomer")
//            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
            if let JSON = response.result.value as? [[String:AnyObject]] {
                var customers: [Customer] = []
                for item in JSON {
                    let customer = Customer(id: item["id"] as? String ?? "",
                                            custno: item["custno"] as? String ?? "",
                                            custname: item["custname"] as? String ?? "",
                                            custabbr: item["custabbr"] as? String ?? "",
                                            ckindno: item["ckindno"] as? String ?? "",
                                            empno: item["empno"] as? String ?? "",
                                            con1: item["con1"] as? String ?? "",
                                            con2: item["con2"] as? String ?? "",
                                            boss: item["boss"] as? String ?? "",
                                            tel1: item["tel1"] as? String ?? "",
                                            tel2: item["tel2"] as? String ?? "",
                                            fax: item["fax"] as? String ?? "",
                                            acttel1: item["acttel1"] as? String ?? "",
                                            acttel2: item["acttel2"] as? String ?? "",
                                            bbc: item["bbc"] as? String ?? "",
                                            compaddr: item["compaddr"] as? String ?? "",
                                            invoaddr: item["invoaddr"] as? String ?? "",
                                            sendaddr: item["sendaddr"] as? String ?? "",
                                            compzip: item["compzip"] as? String ?? "",
                                            uniform: item["uniform"] as? String ?? "",
                                            akindno: item["akindno"] as? String ?? "",
                                            trust: item["trust"] as? String ?? "",
                                            email: item["email"] as? String ?? "",
                                            memo: item["memo"] as? String ?? "",
                                            beginpre: item["beginpre"] as? String ?? "",
                                            prercv: item["prercv"] as? String ?? "",
                                            beginacc: item["beginacc"] as? String ?? "",
                                            washacc: item["washacc"] as? String ?? "",
                                            appedate2: item["appedate2"] as? String ?? "",
                                            discper: item["discper"] as? String ?? "",
                                            priceclass: item["priceclass"] as? String ?? "",
                                            custud1: item["custud1"] as? String ?? "",
                                            custud2: item["custud2"] as? String ?? "",
                                            areano: item["areano"] as? String ?? "",
                                            iksno: item["iksno"] as? String ?? "",
                                            currno: item["currno"] as? String ?? "",
                                            invozip: item["invozip"] as? String ?? "",
                                            sendzip: item["sendzip"] as? String ?? "",
                                            udf00: item["udf00"] as? String ?? "",
                                            udf01: item["udf01"] as? String ?? "",
                                            udf02: item["udf02"] as? String ?? "",
                                            udf03: item["udf03"] as? String ?? "",
                                            udf04: item["udf04"] as? String ?? "",
                                            udf05: item["udf05"] as? String ?? "",
                                            udf06: item["udf06"] as? String ?? "",
                                            udf07: item["udf07"] as? String ?? "",
                                            udf08: item["udf08"] as? String ?? "",
                                            udf09: item["udf09"] as? String ?? "",
                                            udf10: item["udf10"] as? String ?? "",
                                            acustno: item["acustno"] as? String ?? "",
                                            icustno: item["icustno"] as? String ?? "",
                                            accday: item["accday"] as? String ?? "",
                                            getsprice: item["getsprice"] as? String ?? "",
                                            appedate1: item["appedate1"] as? String ?? "",
                                            appedate3: item["appedate3"] as? String ?? "",
                                            taxkind: item["taxkind"] as? String ?? "",
                                            accflag: item["accflag"] as? String ?? "")
                    customers.append(customer)
//                    print("item: \(customer.custabbr)")
                }
                completionHandler(true, customers)
            }else {
                print("getCustomer: get JSON error")
                completionHandler(false, nil)
            }
    }
}

/// 取員工
func getEmployee(completionHandler: @escaping (_ status: Bool, _ data: [Employee]?) -> Void){
    Alamofire.request(dataUrl + GET_EMPLOYEE, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
//            print("getEmployee")
//            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
//            print("getEmployee: \(self.dataUrl + GET_EMPLOYEE)")
            if let JSON = response.result.value as? [[String:AnyObject]] {
                var employees: [Employee] = []
                for item in JSON {
                    let employee = Employee(EMPNAME: item["EMPNAME"] as? String ?? "",
                                            EMPNO: item["EMPNO"] as? String ?? "",
                                            TEL: item["TEL"] as? String ?? "",
                                            UDF07: item["UDF07"] as? String ?? "",
                                            UDF02: item["UDF02"] as? String ?? "",
                                            UDF06: item["UDF06"] as? String ?? "",
                                            id: item["id"] as? String ?? "",
                                            UDF03: item["UDF03"] as? String ?? "",
                                            ACTTEL: item["ACTTEL"] as? String ?? "",
                                            ADDRESS: item["ADDRESS"] as? String ?? "",
                                            MEMO: item["MEMO"] as? String ?? "",
                                            UDF01: item["UDF01"] as? String ?? "",
                                            DEPANO: item["DEPANO"] as? String ?? "",
                                            UDF08: item["UDF08"] as? String ?? "",
                                            BBC: item["BBC"] as? String ?? "",
                                            UDF04: item["UDF04"] as? String ?? "",
                                            UDF05: item["UDF05"] as? String ?? "",
                                            PASSWORD: item["PASSWORD"] as? String ?? "")
                    employees.append(employee)
                }
                completionHandler(true, employees)
            }else {
                print("getEmployee: get JSON error")
                completionHandler(false, nil)
            }
    }
}

/// 取供應
func getSupplier(completionHandler: @escaping (_ status: Bool, _ data: [Supplier]?) -> Void){
    Alamofire.request(dataUrl + GET_SUPPLIER, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
//            print("getSupplier")
//            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
            if let JSON = response.result.value as? [[String:AnyObject]] {
                var suppliers: [Supplier] = []
                for item in JSON {
                    let supplier = Supplier(id: item["id"] as? String ?? "",
                                             SUPPNO: item["SUPPNO"] as? String ?? "",
                                             SUPPNAME: item["SUPPNAME"] as? String ?? "",
                                             SUPPABBR: item["SUPPABBR"] as? String ?? "",
                                             EMPNO: item["EMPNO"] as? String ?? "",
                                             BOSS: item["BOSS"] as? String ?? "",
                                             CON1: item["CON1"] as? String ?? "",
                                             CON2: item["CON2"] as? String ?? "",
                                             TEL1: item["TEL1"] as? String ?? "",
                                             TEL2: item["TEL2"] as? String ?? "",
                                             FAX: item["FAX"] as? String ?? "",
                                             ACTTEL1: item["ACTTEL1"] as? String ?? "",
                                             ACTTEL2: item["ACTTEL2"] as? String ?? "",
                                             BBC: item["BBC"] as? String ?? "",
                                             COMPADDR: item["COMPADDR"] as? String ?? "",
                                             FACTADDR: item["FACTADDR"] as? String ?? "",
                                             TAXKIND: item["TAXKIND"] as? String ?? "",
                                             UNIFORM: item["UNIFORM"] as? String ?? "",
                                             COMPZIP: item["COMPZIP"] as? String ?? "",
                                             AKINDNO: item["AKINDNO"] as? String ?? "",
                                             BUSINESS: item["BUSINESS"] as? String ?? "",
                                             EMAIL: item["EMAIL"] as? String ?? "",
                                             MEMO: item["MEMO"] as? String ?? "",
                                             BEGINPRE: item["BEGINPRE"] as? String ?? "",
                                             PREPAY: item["PREPAY"] as? String ?? "",
                                             BEGINACC: item["BEGINACC"] as? String ?? "",
                                             WASHACC: item["WASHACC"] as? String ?? "",
                                             APPEDATE2: item["APPEDATE2"] as? String ?? "",
                                             ACCFLAG: item["ACCFLAG"] as? String ?? "",
                                             SKINDNO: item["SKINDNO"] as? String ?? "",
                                             SUPPUD1: item["SUPPUD1"] as? String ?? "",
                                             SUPPUD2: item["SUPPUD2"] as? String ?? "",
                                             CURRNO: item["CURRNO"] as? String ?? "",
                                             FACTZIP: item["FACTZIP"] as? String ?? "",
                                             UDF00: item["UDF00"] as? String ?? "",
                                             UDF01: item["UDF01"] as? String ?? "",
                                             UDF02: item["UDF02"] as? String ?? "",
                                             UDF03: item["UDF03"] as? String ?? "",
                                             UDF04: item["UDF04"] as? String ?? "",
                                             UDF05: item["UDF05"] as? String ?? "",
                                             UDF06: item["UDF06"] as? String ?? "",
                                             UDF07: item["UDF07"] as? String ?? "",
                                             UDF08: item["UDF08"] as? String ?? "",
                                             UDF09: item["UDF09"] as? String ?? "",
                                             UDF10: item["UDF10"] as? String ?? "",
                                             ASUPPNO: item["ASUPPNO"] as? String ?? "",
                                             ISUPPNO: item["ISUPPNO"] as? String ?? "",
                                             IKSNO: item["IKSNO"] as? String ?? "",
                                             ACCDAY: item["ACCDAY"] as? String ?? "",
                                             APPEDATE1: item["APPEDATE1"] as? String ?? "",
                                             APPEDATE3: item["APPEDATE3"] as? String ?? "")
                    suppliers.append(supplier)
                }
                completionHandler(true, suppliers)
            }else {
                print("getSupplier: get JSON error")
                completionHandler(false, nil)
            }
    }
}



}


