//
//  EmployeeModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/13.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class Employee: NSObject {
    var EMPNAME: String!
    var EMPNO: String!
    var TEL: String!
    var UDF07: String!
    var UDF02: String!
    var UDF06: String!
    var id: String!
    var UDF03: String!
    var ACTTEL: String!
    var ADDRESS: String!
    var MEMO: String!
    var UDF01: String!
    var DEPANO: String!
    var UDF08: String!
    var BBC: String!
    var UDF04: String!
    var UDF05: String!
    var PASSWORD: String!
    
    init(EMPNAME: String, EMPNO: String, TEL: String, UDF07: String, UDF02: String, UDF06: String, id: String, UDF03: String, ACTTEL: String, ADDRESS: String, MEMO: String, UDF01: String, DEPANO: String, UDF08: String, BBC: String, UDF04: String, UDF05: String, PASSWORD: String) {
        self.EMPNAME = EMPNAME
        self.EMPNO = EMPNO
        self.TEL = TEL
        self.UDF07 = UDF07
        self.UDF02 = UDF02
        self.UDF06 = UDF06
        self.id = id
        self.UDF03 = UDF03
        self.ACTTEL = ACTTEL
        self.ADDRESS = ADDRESS
        self.MEMO = MEMO
        self.UDF01 = UDF01
        self.DEPANO = DEPANO
        self.UDF08 = UDF08
        self.BBC = BBC
        self.UDF04 = UDF04
        self.UDF05 = UDF05
        self.PASSWORD = PASSWORD
    }
}
