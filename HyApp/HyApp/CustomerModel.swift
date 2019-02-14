//
//  CustomModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/11.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class Customer: NSObject {
    var id: String!
    var custno: String!
    var custname: String!
    var custabbr: String!
    var ckindno: String!
    var empno: String!
    var con1: String!
    var con2: String!
    var boss: String!
    var tel1: String!
    var tel2: String!
    var fax: String!
    var acttel1: String!
    var acttel2: String!
    var bbc: String!
    var compaddr: String!
    var invoaddr: String!
    var sendaddr: String!
    var compzip: String!
    var uniform: String!
    var akindno: String!
    var trust: String!
    var email: String!
    var memo: String!
    var beginpre: String!
    var prercv: String!
    var beginacc: String!
    var washacc: String!
    var appedate2: String!
    var discper: String!
    var priceclass: String!
    var custud1: String!
    var custud2: String!
    var areano: String!
    var iksno: String!
    var currno: String!
    var invozip: String!
    var sendzip: String!
    var udf00: String!
    var udf01: String!
    var udf02: String!
    var udf03: String!
    var udf04: String!
    var udf05: String!
    var udf06: String!
    var udf07: String!
    var udf08: String!
    var udf09: String!
    var udf10: String!
    var acustno: String!
    var icustno: String!
    var accday: String!
    var getsprice: String!
    var appedate1: String!
    var appedate3: String!
    var taxkind: String!
    var accflag: String!
    
    //  boss負責人、custabbr客戶簡稱、custno編號(List)、empno業務人員、compaddr公司地址、sendaddr送貨地址、invoaddr發票地址、email、tel1電話1、fax傳真機、tel2電話2、bbc呼叫機
    //  con1聯絡人1、con2聯絡人2、acttel1聯絡人1電話、acttel2聯絡人2電話、uniform統一編號、ckindno客戶類別、areano區域編號、iksno營業稅1、taxkindd發票種類1、acustno請款對象
    //  icustnos發票對象、accday結帳日、trust信用額度、memo備註、prercv欲收餘額、appedate2建檔日期
    init(id: String, boss: String, custabbr: String, custno: String, empno: String, compaddr: String, sendaddr: String, email: String, tel1: String, fax: String, tel2: String, bbc: String, con1: String, con2: String, acttel1: String, acttel2: String, uniform: String, ckindno: String, areano: String, iksno: String, acustno: String, icustno: String, accday: String, trust: String, memo: String, prercv: String, appedate2: String) {
        self.id = id
        self.boss = boss
        self.custabbr = custabbr
        self.custno = custno
        self.empno = empno
        self.compaddr = compaddr
        self.sendaddr = sendaddr
        self.email = email
        self.tel1 = tel1
        self.fax = fax
        self.tel2 = tel2
        self.bbc = bbc
        self.con1 = con1
        self.con2 = con2
        self.acttel1 = acttel1
        self.acttel2 = acttel2
        self.uniform = uniform
        self.ckindno = ckindno
        self.areano = areano
        self.iksno = iksno
        self.acustno = acustno
        self.icustno = icustno
        self.accday = accday
        self.trust = trust
        self.memo = memo
        self.prercv = prercv
        self.appedate2 = appedate2
    }
}
