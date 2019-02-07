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
    private var dataUrl = ""
    
    static var shared: APIManager! {
        if _shared == nil {
            _shared = APIManager()
        }
        return _shared
    }
    
    /// 登入
    func login(account: String, password: String, completionHandler: @escaping (_ status: Bool, _ message: String) -> Void){
        let parameters = ["account": account, "passwd": password] as [String : Any]
        Alamofire.request(CK_ACCOUNT, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
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
                                    let dataurl = data["dataurl"] as? String {
                                    
                                    let user = User(id: id, account: account, passwd: passwd, phone: phone, name: name, corpname: corpname, email: email, imei: imei, memo1: memo1, memo2: memo2, status1: status1, status2: status2, dataurl: dataurl)
                                    thisUser = user
                                    self.dataUrl = dataurl
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

/// 取顧客
func getCustomer(completionHandler: @escaping (_ status: Bool, _ data: [String : AnyObject]?) -> Void){
    //        if dataUrl == "" { return }
    Alamofire.request(dataUrl + GET_CUSTOMER, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
            print("getCustomer")
            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
            if let JSON = response.result.value as? [[String:AnyObject]] {
                for item in JSON {
                    print("item: \(item)")
                }
            }else {
                print("getSupplier: get JSON error")
                completionHandler(false, nil)
            }
    }
}

/// 取員工
func getEmployee(completionHandler: @escaping (_ status: Bool, _ data: [String : AnyObject]?) -> Void){
    Alamofire.request(dataUrl + GET_EMPLOYEE, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
            print("getEmployee")
            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
            if let JSON = response.result.value as? [[String:AnyObject]] {
                for item in JSON {
                    print("item: \(item)")
                }
            }else {
                print("getSupplier: get JSON error")
                completionHandler(false, nil)
            }
    }
}

/// 取供應
func getSupplier(completionHandler: @escaping (_ status: Bool, _ data: [String : AnyObject]?) -> Void){
    Alamofire.request(dataUrl + GET_SUPPLIER, method: .post, encoding: URLEncoding.httpBody)
        .downloadProgress { progress in
            print("getSupplier")
            print("\(progress.fractionCompleted)")
        }
        .responseJSON { response in
            if let JSON = response.result.value as? [[String:AnyObject]] {
                for item in JSON {
                    print("item: \(item)")
                }
            }else {
                print("getSupplier: get JSON error")
                completionHandler(false, nil)
            }
    }
}



}


