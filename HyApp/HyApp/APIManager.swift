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
    func login(account: String, password: String, completionHandler: @escaping (_ status: Bool, _ data: [String : AnyObject]?) -> Void){
        let parameters = ["account": account, "passwd": password] as [String : Any]
        Alamofire.request(CK_ACCOUNT, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseJSON { response in
                if let JSON = response.result.value as? [String:AnyObject] {
                    if let result = JSON["result"] as? String,
                        let data = JSON["data"] as? [String:String]{
                        if let data_url = data["dataurl"] as? String {
                            self.dataUrl = data_url
                            self.getCustomer(completionHandler: { (_, _) in
                                //
                            })
                            self.getEmployee(completionHandler: { (_, _) in
                                //
                            })
                            self.getSupplier(completionHandler: { (_, _) in
                                //
                            })
                        }
                        print("JSON: \(JSON)")
                    }
                }else {
                    print("login: get JSON error")
                    completionHandler(false, nil)
                }
        }
    }
    
    /// 取顧客
    func getCustomer(completionHandler: @escaping (_ status: Bool, _ data: [String : AnyObject]?) -> Void){
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


