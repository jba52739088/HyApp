//
//  UserModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/7.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id: String!
    var account: String!
    var passwd: String!
    var phone: String!
    var name: String!
    var corpname: String!
    var email: String!
    var imei: String!
    var memo1: String!
    var memo2: String!
    var status1: String!
    var status2: String!
    var dataurl: String!
    var source: String!
    
    init( id: String, account: String, passwd: String, phone: String, name: String, corpname: String, email: String, imei: String, memo1: String, memo2: String, status1: String, status2: String, dataurl: String, source: String) {
        self.id = id
        self.account = account
        self.passwd = passwd
        self.phone = phone
        self.name = name
        self.corpname = corpname
        self.email = email
        self.imei = imei
        self.memo1 = memo1
        self.memo2 = memo2
        self.status1 = status1
        self.status2 = status2
        self.dataurl = dataurl
        self.source = source
    }
}
