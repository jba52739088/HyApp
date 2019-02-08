//
//  UserDefaultsKey.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/8.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

let HY_ACCOUNT = "###HY_ACCOUNT"
let HY_PASSWORD = "###HY_PASSWORD"
let HY_REMEBER = "###HY_REMEBER"
let HY_SHOW = "###HY_SHOW"


class UserDefaultsKeys: NSObject {
    
    static var ACCOUNT:String{
        get{
            return UserDefaults.standard.string(forKey: HY_ACCOUNT) ?? ""
        }
    }
    
    static var PASSWORD:String{
        get{
            return UserDefaults.standard.string(forKey: HY_PASSWORD) ?? ""
        }
    }
    
    static var REMEBER:Bool{
        get{
            return UserDefaults.standard.bool(forKey: HY_REMEBER)
        }
    }
    
    static var SHOW:Bool{
        get{
            return UserDefaults.standard.bool(forKey: HY_SHOW)
        }
    }
    
}
