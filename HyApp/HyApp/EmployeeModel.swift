//
//  EmployeeModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/13.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class Employee: NSObject {
    var EMPNAME = ""
    var EMPNO = ""
    var TEL = ""
    var UDF07 = ""
    var UDF02 = ""
    var UDF06 = ""
    var id = ""
    var UDF03 = ""
    var ACTTEL = ""
    var ADDRESS = ""
    var MEMO = ""
    var UDF01 = ""
    var DEPANO = ""
    var UDF08 = ""
    var BBC = ""
    var UDF04 = ""
    var UDF05 = ""
    var PASSWORD = ""
    
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
