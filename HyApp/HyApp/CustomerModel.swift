//
//  CustomModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/11.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class Customer: NSObject {
    var id = ""
    var custno = ""
    var custname = ""
    var custabbr = ""
    var ckindno = ""
    var empno = ""
    var con1 = ""
    var con2 = ""
    var boss = ""
    var tel1 = ""
    var tel2 = ""
    var fax = ""
    var acttel1 = ""
    var acttel2 = ""
    var bbc = ""
    var compaddr = ""
    var invoaddr = ""
    var sendaddr = ""
    var compzip = ""
    var uniform = ""
    var akindno = ""
    var trust = ""
    var email = ""
    var memo = ""
    var beginpre = ""
    var prercv = ""
    var beginacc = ""
    var washacc = ""
    var appedate2 = ""
    var discper = ""
    var priceclass = ""
    var custud1 = ""
    var custud2 = ""
    var areano = ""
    var iksno = ""
    var currno = ""
    var invozip = ""
    var sendzip = ""
    var udf00 = ""
    var udf01 = ""
    var udf02 = ""
    var udf03 = ""
    var udf04 = ""
    var udf05 = ""
    var udf06 = ""
    var udf07 = ""
    var udf08 = ""
    var udf09 = ""
    var udf10 = ""
    var acustno = ""
    var icustno = ""
    var accday = ""
    var getsprice = ""
    var appedate1 = ""
    var appedate3 = ""
    var taxkind = ""
    var accflag = ""
    
    //  boss負責人、custabbr客戶簡稱、custno編號(List)、empno業務人員、compaddr公司地址、sendaddr送貨地址、invoaddr發票地址、email、tel1電話1、fax傳真機、tel2電話2、bbc呼叫機
    //  con1聯絡人1、con2聯絡人2、acttel1聯絡人1電話、acttel2聯絡人2電話、uniform統一編號、ckindno客戶類別、areano區域編號、iksno營業稅1、taxkindd發票種類1、acustno請款對象
    //  icustnos發票對象、accday結帳日、trust信用額度、memo備註、prercv欲收餘額、appedate2建檔日期
    init(id: String, custno: String, custname: String, custabbr: String, ckindno: String, empno: String, con1: String, con2: String, boss: String, tel1: String, tel2: String, fax: String, acttel1: String, acttel2: String, bbc: String, compaddr: String, invoaddr: String, sendaddr: String, compzip: String, uniform: String, akindno: String, trust: String, email: String, memo: String, beginpre: String, prercv: String, beginacc: String, washacc: String, appedate2: String, discper: String, priceclass: String, custud1: String, custud2: String, areano: String, iksno: String, currno: String, invozip: String, sendzip: String, udf00: String, udf01: String, udf02: String, udf03: String, udf04: String, udf05: String, udf06: String, udf07: String, udf08: String, udf09: String, udf10: String, acustno: String, icustno: String, accday: String, getsprice: String, appedate1: String, appedate3: String, taxkind: String, accflag: String) {
        self.id = id
        self.custno = custno
        self.custname = custname
        self.custabbr = custabbr
        self.ckindno = ckindno
        self.empno = empno
        self.con1 = con1
        self.con2 = con2
        self.boss = boss
        self.tel1 = tel1
        self.tel2 = tel2
        self.fax = fax
        self.acttel1 = acttel1
        self.acttel2 = acttel2
        self.bbc = bbc
        self.compaddr = compaddr
        self.invoaddr = invoaddr
        self.sendaddr = sendaddr
        self.compzip = compzip
        self.uniform = uniform
        self.akindno = akindno
        self.trust = trust
        self.email = email
        self.memo = memo
        self.beginpre = beginpre
        self.prercv = prercv
        self.beginacc = beginacc
        self.washacc = washacc
        self.appedate2 = appedate2
        self.discper = discper
        self.priceclass = priceclass
        self.custud1 = custud1
        self.custud2 = custud2
        self.areano = areano
        self.iksno = iksno
        self.currno = currno
        self.invozip = invozip
        self.sendzip = sendzip
        self.udf00 = udf00
        self.udf01 = udf01
        self.udf02 = udf02
        self.udf03 = udf03
        self.udf04 = udf04
        self.udf05 = udf05
        self.udf06 = udf06
        self.udf07 = udf07
        self.udf08 = udf08
        self.udf09 = udf09
        self.udf10 = udf10
        self.acustno = acustno
        self.icustno = icustno
        self.accday = accday
        self.getsprice = getsprice
        self.appedate1 = appedate1
        self.appedate3 = appedate3
        self.taxkind = taxkind
        self.accflag = accflag
    }
}
