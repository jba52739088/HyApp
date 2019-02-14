//
//  SupplierModel.swift
//  HyApp
//
//  Created by 黃恩祐 on 2019/2/14.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation

class Supplier: NSObject {
    var id: String!
    var SUPPNO: String!
    var SUPPNAME: String!
    var SUPPABBR: String!
    var EMPNO: String!
    var BOSS: String!
    var CON1: String!
    var CON2: String!
    var TEL1: String!
    var TEL2: String!
    var FAX: String!
    var ACTTEL1: String!
    var ACTTEL2: String!
    var BBC: String!
    var COMPADDR: String!
    var FACTADDR: String!
    var TAXKIND: String!
    var UNIFORM: String!
    var COMPZIP: String!
    var AKINDNO: String!
    var BUSINESS: String!
    var EMAIL: String!
    var MEMO: String!
    var BEGINPRE: String!
    var PREPAY: String!
    var BEGINACC: String!
    var WASHACC: String!
    var APPEDATE2: String!
    var ACCFLAG: String!
    var SKINDNO: String!
    var SUPPUD1: String!
    var SUPPUD2: String!
    var CURRNO: String!
    var FACTZIP: String!
    var UDF00: String!
    var UDF01: String!
    var UDF02: String!
    var UDF03: String!
    var UDF04: String!
    var UDF05: String!
    var UDF06: String!
    var UDF07: String!
    var UDF08: String!
    var UDF09: String!
    var UDF10: String!
    var ASUPPNO: String!
    var ISUPPNO: String!
    var IKSNO: String!
    var ACCDAY: String!
    var APPEDATE1: String!
    var APPEDATE3: String!
    
    init(id: String, SUPPNO: String, SUPPNAME: String, SUPPABBR: String, EMPNO: String, BOSS: String, CON1: String, CON2: String, TEL1: String, TEL2: String, FAX: String, ACTTEL1: String, ACTTEL2: String, BBC: String, COMPADDR: String, FACTADDR: String, TAXKIND: String, UNIFORM: String, COMPZIP: String, AKINDNO: String, BUSINESS: String, EMAIL: String, MEMO: String, BEGINPRE: String, PREPAY: String, BEGINACC: String, WASHACC: String, APPEDATE2: String, ACCFLAG: String, SKINDNO: String, SUPPUD1: String, SUPPUD2: String, CURRNO: String, FACTZIP: String, UDF00: String, UDF01: String, UDF02: String, UDF03: String, UDF04: String, UDF05: String, UDF06: String, UDF07: String, UDF08: String, UDF09: String, UDF10: String, ASUPPNO: String, ISUPPNO: String, IKSNO: String, ACCDAY: String, APPEDATE1: String, APPEDATE3: String!) {
        self.id = id
        self.SUPPNO = SUPPNO
        self.SUPPNAME = SUPPNAME
        self.SUPPABBR = SUPPABBR
        self.EMPNO = EMPNO
        self.BOSS = BOSS
        self.CON1 = CON1
        self.CON2 = CON2
        self.TEL1 = TEL1
        self.TEL2 = TEL2
        self.FAX = FAX
        self.ACTTEL1 = ACTTEL1
        self.ACTTEL2 = ACTTEL2
        self.BBC = BBC
        self.COMPADDR = COMPADDR
        self.FACTADDR = FACTADDR
        self.TAXKIND = TAXKIND
        self.UNIFORM = UNIFORM
        self.COMPZIP = COMPZIP
        self.AKINDNO = AKINDNO
        self.BUSINESS = BUSINESS
        self.EMAIL = EMAIL
        self.MEMO = MEMO
        self.BEGINPRE = BEGINPRE
        self.PREPAY = PREPAY
        self.BEGINACC = BEGINACC
        self.WASHACC = WASHACC
        self.APPEDATE2 = APPEDATE2
        self.ACCFLAG = ACCFLAG
        self.SKINDNO = SKINDNO
        self.SUPPUD1 = SUPPUD1
        self.SUPPUD2 = SUPPUD2
        self.CURRNO = CURRNO
        self.FACTZIP = FACTZIP
        self.UDF00 = UDF00
        self.UDF01 = UDF01
        self.UDF02 = UDF02
        self.UDF03 = UDF03
        self.UDF04 = UDF04
        self.UDF05 = UDF05
        self.UDF06 = UDF05
        self.UDF07 = UDF07
        self.UDF08 = UDF08
        self.UDF09 = UDF09
        self.UDF10 = UDF10
        self.ASUPPNO = ASUPPNO
        self.ISUPPNO = ISUPPNO
        self.IKSNO = IKSNO
        self.ACCDAY = ACCDAY
        self.APPEDATE1 = APPEDATE1
        self.APPEDATE3 = APPEDATE3
    }
}
