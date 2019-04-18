//
//  SQLiteManager.swift
//  pianoLearningApp
//
//  Created by Vincent_Huang on 2019/3/10.
//  Copyright © 2019年 ENYUHUANG. All rights reserved.
//

import Foundation
import SQLite

class SQLiteManager {
    
    static private var _shared: SQLiteManager?
    
    static var shared: SQLiteManager! {
        if _shared == nil {
            _shared = SQLiteManager()
        }
        return _shared
    }
    
    private let db: Connection?
    private let databaseFileName = "HyApp.db"
    private let customerTable = Table("Customer")
    private let employeeTable = Table("Employee")
    private let supplierTable = Table("supplier")
    private let favoriteTable = Table("favorite")
    
    private let CUST_id = Expression<String >("id")
    private let CUST_CUSTNO = Expression<String>("CUSTNO")
    private let CUST_CUSTNAME = Expression<String>("CUSTNAME")
    private let CUST_CUSTABBR = Expression<String>("CUSTABBR")
    private let CUST_CKINDNO = Expression<String>("CKINDNO")
    private let CUST_EMPNO = Expression<String>("EMPNO")
    private let CUST_CON1 = Expression<String>("CON1")
    private let CUST_CON2 = Expression<String>("CON2")
    private let CUST_BOSS = Expression<String>("BOSS")
    private let CUST_TEL1 = Expression<String>("TEL1")
    private let CUST_TEL2 = Expression<String>("TEL2")
    private let CUST_FAX = Expression<String>("FAX")
    private let CUST_ACTTEL1 = Expression<String>("ACTTEL1")
    private let CUST_ACTTEL2 = Expression<String>("ACTTEL2")
    private let CUST_BBC = Expression<String>("BBC")
    private let CUST_COMPADDR = Expression<String>("COMPADDR")
    private let CUST_INVOADDR = Expression<String>("INVOADDR")
    private let CUST_SENDADDR = Expression<String>("SENDADDR")
    private let CUST_COMPZIP = Expression<String>("COMPZIP")
    private let CUST_TAXKIND = Expression<String>("TAXKIND")
    private let CUST_UNIFORM = Expression<String>("UNIFORM")
    private let CUST_AKINDNO = Expression<String>("AKINDNO")
    private let CUST_TRUST = Expression<String>("TRUST")
    private let CUST_EMAIL = Expression<String>("EMAIL")
    private let CUST_MEMO = Expression<String>("MEMO")
    private let CUST_BEGINPRE = Expression<String>("BEGINPRE")
    private let CUST_PRERCV = Expression<String>("PRERCV")
    private let CUST_BEGINACC = Expression<String>("BEGINACC")
    private let CUST_WASHACC = Expression<String>("WASHACC")
    private let CUST_APPEDATE2 = Expression<String>("APPEDATE2")
    private let CUST_ACCFLAG = Expression<String>("ACCFLAG")
    private let CUST_DISCPER = Expression<String>("DISCPER")
    private let CUST_PRICECLASS = Expression<String>("PRICECLASS")
    private let CUST_CUSTUD1 = Expression<String>("CUSTUD1")
    private let CUST_CUSTUD2 = Expression<String>("CUSTUD2")
    private let CUST_AREANO = Expression<String>("AREANO")
    private let CUST_IKSNO = Expression<String>("IKSNO")
    private let CUST_CURRNO = Expression<String>("CURRNO")
    private let CUST_INVOZIP = Expression<String>("INVOZIP")
    private let CUST_SENDZIP = Expression<String>("SENDZIP")
    private let CUST_UDF01 = Expression<String>("UDF01")
    private let CUST_UDF02 = Expression<String>("UDF02")
    private let CUST_UDF03 = Expression<String>("UDF03")
    private let CUST_UDF04 = Expression<String>("UDF04")
    private let CUST_UDF05 = Expression<String>("UDF05")
    private let CUST_UDF06 = Expression<String>("UDF06")
    private let CUST_UDF07 = Expression<String>("UDF07")
    private let CUST_UDF08 = Expression<String>("UDF08")
    private let CUST_UDF09 = Expression<String>("UDF09")
    private let CUST_UDF10 = Expression<String>("UDF10")
    private let CUST_UDF00 = Expression<String>("UDF00")
    private let CUST_ACUSTNO = Expression<String>("ACUSTNO")
    private let CUST_ICUSTNO = Expression<String>("ICUSTNO")
    private let CUST_ACCDAY = Expression<String>("ACCDAY")
    private let CUST_GETSPRICE = Expression<String>("GETSPRICE")
    private let CUST_APPEDATE1 = Expression<String>("APPEDATE1")
    private let CUST_APPEDATE3 = Expression<String>("APPEDATE3")

    private let EMP_id = Expression<String>("id")
    private let EMP_EMPNO = Expression<String>("EMPNO")
    private let EMP_EMPNAME = Expression<String>("EMPNAME")
    private let EMP_DEPANO = Expression<String>("DEPANO")
    private let EMP_TEL = Expression<String>("TEL")
    private let EMP_BBC = Expression<String>("BBC")
    private let EMP_ACTTEL = Expression<String>("ACTTEL")
    private let EMP_ADDRESS = Expression<String>("ADDRESS")
    private let EMP_MEMO = Expression<String>("MEMO")
    private let EMP_PASSWORD = Expression<String>("PASSWORD")
    private let EMP_UDF01 = Expression<String>("UDF01")
    private let EMP_UDF02 = Expression<String>("UDF02")
    private let EMP_UDF03 = Expression<String>("UDF03")
    private let EMP_UDF04 = Expression<String>("UDF04")
    private let EMP_UDF05 = Expression<String>("UDF05")
    private let EMP_UDF06 = Expression<String>("UDF06")
    private let EMP_UDF07 = Expression<String>("UDF07")
    private let EMP_UDF08 = Expression<String>("UDF08")
    
    private let SUP_id = Expression<String>("id")
    private let SUP_SUPPNO = Expression<String>("SUPPNO")
    private let SUP_SUPPNAME = Expression<String>("SUPPNAME")
    private let SUP_SUPPABBR = Expression<String>("SUPPABBR")
    private let SUP_EMPNO = Expression<String>("EMPNO")
    private let SUP_BOSS = Expression<String>("BOSS")
    private let SUP_CON1 = Expression<String>("CON1")
    private let SUP_CON2 = Expression<String>("CON2")
    private let SUP_TEL1 = Expression<String>("TEL1")
    private let SUP_TEL2 = Expression<String>("TEL2")
    private let SUP_FAX = Expression<String>("FAX")
    private let SUP_ACTTEL1 = Expression<String>("ACTTEL1")
    private let SUP_ACTTEL2 = Expression<String>("ACTTEL2")
    private let SUP_BBC = Expression<String>("BBC")
    private let SUP_COMPADDR = Expression<String>("COMPADDR")
    private let SUP_FACTADDR = Expression<String>("FACTADDR")
    private let SUP_TAXKIND = Expression<String>("TAXKIND")
    private let SUP_COMPZIP = Expression<String>("COMPZIP")
    private let SUP_AKINDNO = Expression<String>("AKINDNO")
    private let SUP_UNIFORM = Expression<String>("UNIFORM")
    private let SUP_BUSINESS = Expression<String>("BUSINESS")
    private let SUP_EMAIL = Expression<String>("EMAIL")
    private let SUP_MEMO = Expression<String>("MEMO")
    private let SUP_BEGINPRE = Expression<String>("BEGINPRE")
    private let SUP_PREPAY = Expression<String>("PREPAY")
    private let SUP_BEGINACC = Expression<String>("BEGINACC")
    private let SUP_WASHACC = Expression<String>("WASHACC")
    private let SUP_APPEDATE2 = Expression<String>("APPEDATE2")
    private let SUP_ACCFLAG = Expression<String>("ACCFLAG")
    private let SUP_SKINDNO = Expression<String>("SKINDNO")
    private let SUP_SUPPUD1 = Expression<String>("SUPPUD1")
    private let SUP_SUPPUD2 = Expression<String>("SUPPUD2")
    private let SUP_CURRNO = Expression<String>("CURRNO")
    private let SUP_FACTZIP = Expression<String>("FACTZIP")
    private let SUP_UDF00 = Expression<String>("UDF00")
    private let SUP_UDF01 = Expression<String>("UDF01")
    private let SUP_UDF02 = Expression<String>("UDF02")
    private let SUP_UDF03 = Expression<String>("UDF03")
    private let SUP_UDF04 = Expression<String>("UDF04")
    private let SUP_UDF05 = Expression<String>("UDF05")
    private let SUP_UDF06 = Expression<String>("UDF06")
    private let SUP_UDF07 = Expression<String>("UDF07")
    private let SUP_UDF08 = Expression<String>("UDF08")
    private let SUP_UDF09 = Expression<String>("UDF09")
    private let SUP_UDF10 = Expression<String>("UDF10")
    private let SUP_ASUPPNO = Expression<String>("ASUPPNO")
    private let SUP_ISUPPNO = Expression<String>("ISUPPNO")
    private let SUP_IKSNO = Expression<String>("IKSNO")
    private let SUP_ACCDAY = Expression<String>("ACCDAY")
    private let SUP_APPEDATE1 = Expression<String>("APPEDATE1")
    private let SUP_APPEDATE3 = Expression<String>("APPEDATE3")
    
    private let FAV_id = Expression<String>("id")
    private let FAV_datatype = Expression<String>("datatype")
    private let FAV_appno = Expression<String>("appno")
    
    

    private init() {
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        do {
            db = try Connection(documentsDirectory.appending("/\(databaseFileName)"))
            print ("open database succeed")
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createDatebase() -> Bool {
        print("db version = \(db?.userVersion ?? 0)")
        if db?.userVersion == 0 {
            if createCustomTable() && createEmployeeTable() && createSupplierTable() && createFavoriteTable() {
                db?.userVersion = 1
                return true
            }else{
                return false
            }
        }else if  db?.userVersion == 1 {
            return true
        }
        return false
//        else if  db?.userVersion == 1 {
//            db?.userVersion = 2
//            if createEmojiGroupTable() && createEmojiTable() {
//                return true
//            }else {
//                return false
//            }
//        }else if  db?.userVersion == 2 {
//            return true
//        }else {
//            return false
//        }
    }
    
    func createCustomTable() -> Bool {
        var createSucceed = false
        do{
            try db!.run(customerTable.create(ifNotExists: true) { table in
                table.column(CUST_id, primaryKey: true)
                table.column(CUST_CUSTNO, defaultValue: "")
                table.column(CUST_CUSTNAME, defaultValue: "")
                table.column(CUST_CUSTABBR, defaultValue: "")
                table.column(CUST_CKINDNO, defaultValue: "")
                table.column(CUST_EMPNO, defaultValue: "")
                table.column(CUST_CON1, defaultValue: "")
                table.column(CUST_CON2, defaultValue: "")
                table.column(CUST_BOSS, defaultValue: "")
                table.column(CUST_TEL1, defaultValue: "")
                table.column(CUST_TEL2, defaultValue: "")
                table.column(CUST_FAX, defaultValue: "")
                table.column(CUST_ACTTEL1, defaultValue: "")
                table.column(CUST_ACTTEL2, defaultValue: "")
                table.column(CUST_BBC, defaultValue: "")
                table.column(CUST_COMPADDR, defaultValue: "")
                table.column(CUST_INVOADDR, defaultValue: "")
                table.column(CUST_SENDADDR, defaultValue: "")
                table.column(CUST_COMPZIP, defaultValue: "")
                table.column(CUST_TAXKIND, defaultValue: "")
                table.column(CUST_UNIFORM, defaultValue: "")
                table.column(CUST_AKINDNO, defaultValue: "")
                table.column(CUST_TRUST, defaultValue: "")
                table.column(CUST_EMAIL, defaultValue: "")
                table.column(CUST_MEMO, defaultValue: "")
                table.column(CUST_BEGINPRE, defaultValue: "")
                table.column(CUST_PRERCV, defaultValue: "")
                table.column(CUST_BEGINACC, defaultValue: "")
                table.column(CUST_WASHACC, defaultValue: "")
                table.column(CUST_APPEDATE2, defaultValue: "")
                table.column(CUST_ACCFLAG, defaultValue: "")
                table.column(CUST_DISCPER, defaultValue: "")
                table.column(CUST_PRICECLASS, defaultValue: "")
                table.column(CUST_CUSTUD1, defaultValue: "")
                table.column(CUST_CUSTUD2, defaultValue: "")
                table.column(CUST_AREANO, defaultValue: "")
                table.column(CUST_IKSNO, defaultValue: "")
                table.column(CUST_CURRNO, defaultValue: "")
                table.column(CUST_INVOZIP, defaultValue: "")
                table.column(CUST_SENDZIP, defaultValue: "")
                table.column(CUST_UDF01, defaultValue: "")
                table.column(CUST_UDF02, defaultValue: "")
                table.column(CUST_UDF03, defaultValue: "")
                table.column(CUST_UDF04, defaultValue: "")
                table.column(CUST_UDF05, defaultValue: "")
                table.column(CUST_UDF06, defaultValue: "")
                table.column(CUST_UDF07, defaultValue: "")
                table.column(CUST_UDF08, defaultValue: "")
                table.column(CUST_UDF09, defaultValue: "")
                table.column(CUST_UDF10, defaultValue: "")
                table.column(CUST_UDF00, defaultValue: "")
                table.column(CUST_ACUSTNO, defaultValue: "")
                table.column(CUST_ICUSTNO, defaultValue: "")
                table.column(CUST_ACCDAY, defaultValue: "")
                table.column(CUST_GETSPRICE, defaultValue: "")
                table.column(CUST_APPEDATE1, defaultValue: "")
                table.column(CUST_APPEDATE3, defaultValue: "")
            })
            //            print("create user Table succeed")
            createSucceed = true
        }catch{
            print("Unable to create userTable")
            print(error.localizedDescription)
        }
        return createSucceed
    }
    
    func createEmployeeTable() -> Bool {
        var createSucceed = false
        do{
            try db!.run(employeeTable.create(ifNotExists: true) { table in
                table.column(EMP_id, primaryKey: true)
                table.column(EMP_EMPNO, defaultValue: "")
                table.column(EMP_EMPNAME, defaultValue: "")
                table.column(EMP_DEPANO, defaultValue: "")
                table.column(EMP_TEL, defaultValue: "")
                table.column(EMP_BBC, defaultValue: "")
                table.column(EMP_ACTTEL, defaultValue: "")
                table.column(EMP_ADDRESS, defaultValue: "")
                table.column(EMP_MEMO, defaultValue: "")
                table.column(EMP_PASSWORD, defaultValue: "")
                table.column(EMP_UDF01, defaultValue: "")
                table.column(EMP_UDF02, defaultValue: "")
                table.column(EMP_UDF03, defaultValue: "")
                table.column(EMP_UDF04, defaultValue: "")
                table.column(EMP_UDF05, defaultValue: "")
                table.column(EMP_UDF06, defaultValue: "")
                table.column(EMP_UDF07, defaultValue: "")
                table.column(EMP_UDF08, defaultValue: "")

            })
            //            print("create user Table succeed")
            createSucceed = true
        }catch{
            print("Unable to create userTable")
            print(error.localizedDescription)
        }
        return createSucceed
    }
    
    func createSupplierTable() -> Bool {
        var createSucceed = false
        do{
            try db!.run(supplierTable.create(ifNotExists: true) { table in
                table.column(SUP_id, primaryKey: true)
                table.column(SUP_SUPPNO, defaultValue: "")
                table.column(SUP_SUPPNAME, defaultValue: "")
                table.column(SUP_SUPPABBR, defaultValue: "")
                table.column(SUP_EMPNO, defaultValue: "")
                table.column(SUP_BOSS, defaultValue: "")
                table.column(SUP_CON1, defaultValue: "")
                table.column(SUP_CON2, defaultValue: "")
                table.column(SUP_TEL1, defaultValue: "")
                table.column(SUP_TEL2, defaultValue: "")
                table.column(SUP_FAX, defaultValue: "")
                table.column(SUP_ACTTEL1, defaultValue: "")
                table.column(SUP_ACTTEL2, defaultValue: "")
                table.column(SUP_BBC, defaultValue: "")
                table.column(SUP_COMPADDR, defaultValue: "")
                table.column(SUP_FACTADDR, defaultValue: "")
                table.column(SUP_TAXKIND, defaultValue: "")
                table.column(SUP_COMPZIP, defaultValue: "")
                table.column(SUP_AKINDNO, defaultValue: "")
                table.column(SUP_UNIFORM, defaultValue: "")
                table.column(SUP_BUSINESS, defaultValue: "")
                table.column(SUP_EMAIL, defaultValue: "")
                table.column(SUP_MEMO, defaultValue: "")
                table.column(SUP_BEGINPRE, defaultValue: "")
                table.column(SUP_PREPAY, defaultValue: "")
                table.column(SUP_BEGINACC, defaultValue: "")
                table.column(SUP_WASHACC, defaultValue: "")
                table.column(SUP_APPEDATE2, defaultValue: "")
                table.column(SUP_ACCFLAG, defaultValue: "")
                table.column(SUP_SKINDNO, defaultValue: "")
                table.column(SUP_SUPPUD1, defaultValue: "")
                table.column(SUP_SUPPUD2, defaultValue: "")
                table.column(SUP_CURRNO, defaultValue: "")
                table.column(SUP_FACTZIP, defaultValue: "")
                table.column(SUP_UDF00, defaultValue: "")
                table.column(SUP_UDF01, defaultValue: "")
                table.column(SUP_UDF02, defaultValue: "")
                table.column(SUP_UDF03, defaultValue: "")
                table.column(SUP_UDF04, defaultValue: "")
                table.column(SUP_UDF05, defaultValue: "")
                table.column(SUP_UDF06, defaultValue: "")
                table.column(SUP_UDF07, defaultValue: "")
                table.column(SUP_UDF08, defaultValue: "")
                table.column(SUP_UDF09, defaultValue: "")
                table.column(SUP_UDF10, defaultValue: "")
                table.column(SUP_ASUPPNO, defaultValue: "")
                table.column(SUP_ISUPPNO, defaultValue: "")
                table.column(SUP_IKSNO, defaultValue: "")
                table.column(SUP_ACCDAY, defaultValue: "")
                table.column(SUP_APPEDATE1, defaultValue: "")
                table.column(SUP_APPEDATE3, defaultValue: "")
                
            })
            //            print("create user Table succeed")
            createSucceed = true
        }catch{
            print("Unable to create userTable")
            print(error.localizedDescription)
        }
        return createSucceed
    }
    
    func createFavoriteTable() -> Bool {
        var createSucceed = false
        do{
            try db!.run(favoriteTable.create(ifNotExists: true) { table in
                table.column(FAV_id, primaryKey: true)
                table.column(FAV_datatype, defaultValue: "")
                table.column(FAV_appno, defaultValue: "")
            })
            //            print("create user Table succeed")
            createSucceed = true
        }catch{
            print("Unable to create userTable")
            print(error.localizedDescription)
        }
        return createSucceed
    }
    

    func insertCustomInfo(_ customer: Customer) -> Bool {
        do {
            let insert = customerTable.insert(CUST_id <- customer.id,
                                              CUST_CUSTNO <- customer.custno,
                                              CUST_CUSTNAME <- customer.custname,
                                              CUST_CUSTABBR <- customer.custabbr,
                                              CUST_CKINDNO <- customer.ckindno,
                                              CUST_EMPNO <- customer.empno,
                                              CUST_CON1 <- customer.con1,
                                              CUST_CON2 <- customer.con2,
                                              CUST_BOSS <- customer.boss,
                                              CUST_TEL1 <- customer.tel1,
                                              CUST_TEL2 <- customer.tel2,
                                              CUST_FAX <- customer.fax,
                                              CUST_ACTTEL1 <- customer.acttel1,
                                              CUST_ACTTEL2 <- customer.acttel2,
                                              CUST_BBC <- customer.bbc,
                                              CUST_COMPADDR <- customer.compaddr,
                                              CUST_INVOADDR <- customer.invoaddr,
                                              CUST_SENDADDR <- customer.sendaddr,
                                              CUST_COMPZIP <- customer.compzip,
                                              CUST_TAXKIND <- customer.taxkind,
                                              CUST_UNIFORM <- customer.uniform,
                                              CUST_AKINDNO <- customer.akindno,
                                              CUST_TRUST <- customer.trust,
                                              CUST_EMAIL <- customer.email,
                                              CUST_MEMO <- customer.memo,
                                              CUST_BEGINPRE <- customer.beginpre,
                                              CUST_PRERCV <- customer.prercv,
                                              CUST_BEGINACC <- customer.beginacc,
                                              CUST_WASHACC <- customer.washacc,
                                              CUST_APPEDATE2 <- customer.appedate2,
                                              CUST_ACCFLAG <- customer.accflag,
                                              CUST_DISCPER <- customer.discper,
                                              CUST_PRICECLASS <- customer.priceclass,
                                              CUST_CUSTUD1 <- customer.custud1,
                                              CUST_CUSTUD2 <- customer.custud2,
                                              CUST_AREANO <- customer.areano,
                                              CUST_IKSNO <- customer.iksno,
                                              CUST_CURRNO <- customer.currno,
                                              CUST_INVOZIP <- customer.invozip,
                                              CUST_SENDZIP <- customer.sendzip,
                                              CUST_UDF01 <- customer.udf01,
                                              CUST_UDF02 <- customer.udf02,
                                              CUST_UDF03 <- customer.udf03,
                                              CUST_UDF04 <- customer.udf04,
                                              CUST_UDF05 <- customer.udf05,
                                              CUST_UDF06 <- customer.udf06,
                                              CUST_UDF07 <- customer.udf07,
                                              CUST_UDF08 <- customer.udf08,
                                              CUST_UDF09 <- customer.udf09,
                                              CUST_UDF10 <- customer.udf10,
                                              CUST_UDF00 <- customer.udf00,
                                              CUST_ACUSTNO <- customer.acustno,
                                              CUST_ICUSTNO <- customer.icustno,
                                              CUST_ACCDAY <- customer.accday,
                                              CUST_GETSPRICE <- customer.getsprice,
                                              CUST_APPEDATE1 <- customer.appedate1,
                                              CUST_APPEDATE3 <- customer.appedate3)
            if try db!.run(insert) > 0 {
                return true
            }
        } catch {
            print("Insert Custom error: \(error.localizedDescription)")
        }
        return false
    }
    
    func insertEmployeeInfo(_ employee: Employee) -> Bool {
        do {
            let insert = employeeTable.insert(EMP_id <- employee.id,
                                              EMP_EMPNO <- employee.EMPNO,
                                              EMP_EMPNAME <- employee.EMPNAME,
                                              EMP_DEPANO <- employee.DEPANO,
                                              EMP_TEL <- employee.TEL,
                                              EMP_BBC <- employee.BBC,
                                              EMP_ACTTEL <- employee.ACTTEL,
                                              EMP_ADDRESS <- employee.ADDRESS,
                                              EMP_MEMO <- employee.MEMO,
                                              EMP_PASSWORD <- employee.PASSWORD,
                                              EMP_UDF01 <- employee.UDF01,
                                              EMP_UDF02 <- employee.UDF02,
                                              EMP_UDF03 <- employee.UDF03,
                                              EMP_UDF04 <- employee.UDF04,
                                              EMP_UDF05 <- employee.UDF05,
                                              EMP_UDF06 <- employee.UDF06,
                                              EMP_UDF07 <- employee.UDF07,
                                              EMP_UDF08 <- employee.UDF08)
            if try db!.run(insert) > 0 {
                return true
            }
        } catch {
            print("Insert Employee error: \(error.localizedDescription)")
        }
        return false
    }
    
    func insertSupplierInfo(_ supplier: Supplier) -> Bool {
        do {
            let insert = supplierTable.insert(SUP_id <- supplier.id,
                                              SUP_SUPPNO <- supplier.SUPPNO,
                                              SUP_SUPPNAME <- supplier.SUPPNAME,
                                              SUP_SUPPABBR <- supplier.SUPPABBR,
                                              SUP_EMPNO <- supplier.EMPNO,
                                              SUP_BOSS <- supplier.BOSS,
                                              SUP_CON1 <- supplier.CON1,
                                              SUP_CON2 <- supplier.CON2,
                                              SUP_TEL1 <- supplier.TEL1,
                                              SUP_TEL2 <- supplier.TEL2,
                                              SUP_FAX <- supplier.FAX,
                                              SUP_ACTTEL1 <- supplier.ACTTEL1,
                                              SUP_ACTTEL2 <- supplier.ACTTEL2,
                                              SUP_BBC <- supplier.BBC,
                                              SUP_COMPADDR <- supplier.COMPADDR,
                                              SUP_FACTADDR <- supplier.FACTADDR,
                                              SUP_TAXKIND <- supplier.TAXKIND,
                                              SUP_COMPZIP <- supplier.COMPZIP,
                                              SUP_AKINDNO <- supplier.AKINDNO,
                                              SUP_UNIFORM <- supplier.UNIFORM,
                                              SUP_BUSINESS <- supplier.BUSINESS,
                                              SUP_EMAIL <- supplier.EMAIL,
                                              SUP_MEMO <- supplier.MEMO,
                                              SUP_BEGINPRE <- supplier.BEGINPRE,
                                              SUP_PREPAY <- supplier.PREPAY,
                                              SUP_BEGINACC <- supplier.BEGINACC,
                                              SUP_WASHACC <- supplier.WASHACC,
                                              SUP_APPEDATE2 <- supplier.APPEDATE2,
                                              SUP_ACCFLAG <- supplier.ACCFLAG,
                                              SUP_SKINDNO <- supplier.SKINDNO,
                                              SUP_SUPPUD1 <- supplier.SUPPUD1,
                                              SUP_SUPPUD2 <- supplier.SUPPUD2,
                                              SUP_CURRNO <- supplier.CURRNO,
                                              SUP_FACTZIP <- supplier.FACTZIP,
                                              SUP_UDF01 <- supplier.UDF01,
                                              SUP_UDF02 <- supplier.UDF02,
                                              SUP_UDF03 <- supplier.UDF03,
                                              SUP_UDF04 <- supplier.UDF04,
                                              SUP_UDF05 <- supplier.UDF05,
                                              SUP_UDF06 <- supplier.UDF06,
                                              SUP_UDF07 <- supplier.UDF07,
                                              SUP_UDF08 <- supplier.UDF08,
                                              SUP_UDF09 <- supplier.UDF09,
                                              SUP_UDF10 <- supplier.UDF10,
                                              SUP_ASUPPNO <- supplier.ASUPPNO,
                                              SUP_ISUPPNO <- supplier.ISUPPNO,
                                              SUP_IKSNO <- supplier.IKSNO,
                                              SUP_ACCDAY <- supplier.ACCDAY,
                                              SUP_APPEDATE1 <- supplier.APPEDATE1,
                                              SUP_APPEDATE3 <- supplier.APPEDATE3)
            if try db!.run(insert) > 0 {
                return true
            }
        } catch {
            print("Insert Supplier error: \(error.localizedDescription)")
        }
        return false
    }
    
    func cleanCustomTable() -> Bool {
        do {
            let delete = customerTable.delete()
            if try db!.run(delete) > 0 {
                return true
            }
        } catch {
            print("delete Custom error: \(error.localizedDescription)")
        }
        return false
    }
    
    func cleanEmployeeTable() -> Bool {
        do {
            let delete = employeeTable.delete()
            if try db!.run(delete) > 0 {
                return true
            }
        } catch {
            print("delete Employee error: \(error.localizedDescription)")
        }
        return false
    }
    
    func cleanSupplierTable() -> Bool {
        do {
            let delete = supplierTable.delete()
            if try db!.run(delete) > 0 {
                return true
            }
        } catch {
            print("delete Supplier error: \(error.localizedDescription)")
        }
        return false
    }
    
    func loadCustomInfo(completionHandler: (_ customers: [Customer]) -> Void) {
        let select = customerTable.filter(CUST_id != "")
        var allCustomers = [Customer]()
        do {
            for aCustomer in try db!.prepare(select) {
                let customer = Customer(id: aCustomer[CUST_id],
                                        custno: aCustomer[CUST_CUSTNO],
                                        custname: aCustomer[CUST_CUSTNAME],
                                        custabbr: aCustomer[CUST_CUSTABBR],
                                        ckindno: aCustomer[CUST_CKINDNO],
                                        empno: aCustomer[CUST_EMPNO],
                                        con1: aCustomer[CUST_CON1],
                                        con2: aCustomer[CUST_CON2],
                                        boss: aCustomer[CUST_BOSS],
                                        tel1: aCustomer[CUST_TEL1],
                                        tel2: aCustomer[CUST_TEL2],
                                        fax: aCustomer[CUST_FAX],
                                        acttel1: aCustomer[CUST_ACTTEL1],
                                        acttel2: aCustomer[CUST_ACTTEL2],
                                        bbc: aCustomer[CUST_BBC],
                                        compaddr: aCustomer[CUST_COMPADDR],
                                        invoaddr: aCustomer[CUST_INVOADDR],
                                        sendaddr: aCustomer[CUST_SENDADDR],
                                        compzip: aCustomer[CUST_COMPZIP],
                                        uniform: aCustomer[CUST_UNIFORM],
                                        akindno: aCustomer[CUST_AKINDNO],
                                        trust: aCustomer[CUST_TRUST],
                                        email: aCustomer[CUST_EMAIL],
                                        memo: aCustomer[CUST_MEMO],
                                        beginpre: aCustomer[CUST_BEGINPRE],
                                        prercv: aCustomer[CUST_PRERCV],
                                        beginacc: aCustomer[CUST_BEGINACC],
                                        washacc: aCustomer[CUST_WASHACC],
                                        appedate2: aCustomer[CUST_APPEDATE2],
                                        discper: aCustomer[CUST_DISCPER],
                                        priceclass: aCustomer[CUST_PRICECLASS],
                                        custud1: aCustomer[CUST_CUSTUD1],
                                        custud2: aCustomer[CUST_CUSTUD2],
                                        areano: aCustomer[CUST_AREANO],
                                        iksno: aCustomer[CUST_IKSNO],
                                        currno: aCustomer[CUST_CURRNO],
                                        invozip: aCustomer[CUST_INVOZIP],
                                        sendzip: aCustomer[CUST_SENDZIP],
                                        udf00: aCustomer[CUST_UDF00],
                                        udf01: aCustomer[CUST_UDF01],
                                        udf02: aCustomer[CUST_UDF02],
                                        udf03: aCustomer[CUST_UDF03],
                                        udf04: aCustomer[CUST_UDF04],
                                        udf05: aCustomer[CUST_UDF05],
                                        udf06: aCustomer[CUST_UDF06],
                                        udf07: aCustomer[CUST_UDF07],
                                        udf08: aCustomer[CUST_UDF08],
                                        udf09: aCustomer[CUST_UDF09],
                                        udf10: aCustomer[CUST_UDF10],
                                        acustno: aCustomer[CUST_ACUSTNO],
                                        icustno: aCustomer[CUST_ICUSTNO],
                                        accday: aCustomer[CUST_ACCDAY],
                                        getsprice: aCustomer[CUST_GETSPRICE],
                                        appedate1: aCustomer[CUST_APPEDATE1],
                                        appedate3: aCustomer[CUST_APPEDATE3],
                                        taxkind: aCustomer[CUST_TAXKIND],
                                        accflag: aCustomer[CUST_ACCFLAG])
                allCustomers.append(customer)
            }
            
        }catch {
            print("loadCustomInfo failed")
        }
        completionHandler(allCustomers)
    }
    
    func loadEmployeeInfo(completionHandler: (_ employee: [Employee]) -> Void) {
        let select = employeeTable.filter(CUST_id != "")
        var allEmployees = [Employee]()
        do {
            for aEmployee in try db!.prepare(select) {
                let employee = Employee(EMPNAME: aEmployee[EMP_EMPNAME],
                                        EMPNO: aEmployee[EMP_EMPNO],
                                        TEL: aEmployee[EMP_TEL],
                                        UDF07: aEmployee[EMP_UDF07],
                                        UDF02: aEmployee[EMP_UDF02],
                                        UDF06: aEmployee[EMP_UDF06],
                                        id: aEmployee[EMP_id],
                                        UDF03: aEmployee[EMP_UDF03],
                                        ACTTEL: aEmployee[EMP_ACTTEL],
                                        ADDRESS: aEmployee[EMP_ADDRESS],
                                        MEMO: aEmployee[EMP_MEMO],
                                        UDF01: aEmployee[EMP_UDF01],
                                        DEPANO: aEmployee[EMP_DEPANO],
                                        UDF08: aEmployee[EMP_UDF08],
                                        BBC: aEmployee[EMP_BBC],
                                        UDF04: aEmployee[EMP_UDF04],
                                        UDF05: aEmployee[EMP_UDF05],
                                        PASSWORD: aEmployee[EMP_PASSWORD])
                allEmployees.append(employee)
            }
            
        }catch {
            print("loadEmployeeInfo failed")
        }
        completionHandler(allEmployees)
        
    }
    
    func loadSupplierInfo(completionHandler: (_ employee: [Supplier]) -> Void) {
        let select = supplierTable.filter(CUST_id != "")
        var allSuppliers = [Supplier]()
        do {
            for aSupplier in try db!.prepare(select) {
                let supplier = Supplier(id: aSupplier[SUP_id],
                                        SUPPNO: aSupplier[SUP_SUPPNO],
                                        SUPPNAME: aSupplier[SUP_SUPPNAME],
                                        SUPPABBR: aSupplier[SUP_SUPPABBR],
                                        EMPNO: aSupplier[SUP_EMPNO],
                                        BOSS: aSupplier[SUP_BOSS],
                                        CON1: aSupplier[SUP_CON1],
                                        CON2: aSupplier[SUP_CON2],
                                        TEL1: aSupplier[SUP_TEL1],
                                        TEL2: aSupplier[SUP_TEL2],
                                        FAX: aSupplier[SUP_FAX],
                                        ACTTEL1: aSupplier[SUP_ACTTEL1],
                                        ACTTEL2: aSupplier[SUP_ACTTEL2],
                                        BBC: aSupplier[SUP_BBC],
                                        COMPADDR: aSupplier[SUP_COMPADDR],
                                        FACTADDR: aSupplier[SUP_FACTADDR],
                                        TAXKIND: aSupplier[SUP_TAXKIND],
                                        UNIFORM: aSupplier[SUP_UNIFORM],
                                        COMPZIP: aSupplier[SUP_COMPZIP],
                                        AKINDNO: aSupplier[SUP_AKINDNO],
                                        BUSINESS: aSupplier[SUP_BUSINESS],
                                        EMAIL: aSupplier[SUP_EMAIL],
                                        MEMO: aSupplier[SUP_MEMO],
                                        BEGINPRE: aSupplier[SUP_BEGINPRE],
                                        PREPAY: aSupplier[SUP_PREPAY],
                                        BEGINACC: aSupplier[SUP_BEGINACC],
                                        WASHACC: aSupplier[SUP_WASHACC],
                                        APPEDATE2: aSupplier[SUP_APPEDATE2],
                                        ACCFLAG: aSupplier[SUP_ACCFLAG],
                                        SKINDNO: aSupplier[SUP_SKINDNO],
                                        SUPPUD1: aSupplier[SUP_SUPPUD1],
                                        SUPPUD2: aSupplier[SUP_SUPPUD2],
                                        CURRNO: aSupplier[SUP_CURRNO],
                                        FACTZIP: aSupplier[SUP_FACTZIP],
                                        UDF00: aSupplier[SUP_UDF00],
                                        UDF01: aSupplier[SUP_UDF01],
                                        UDF02: aSupplier[SUP_UDF02],
                                        UDF03: aSupplier[SUP_UDF03],
                                        UDF04: aSupplier[SUP_UDF04],
                                        UDF05: aSupplier[SUP_UDF05],
                                        UDF06: aSupplier[SUP_UDF06],
                                        UDF07: aSupplier[SUP_UDF07],
                                        UDF08: aSupplier[SUP_UDF08],
                                        UDF09: aSupplier[SUP_UDF09],
                                        UDF10: aSupplier[SUP_UDF10],
                                        ASUPPNO: aSupplier[SUP_ASUPPNO],
                                        ISUPPNO: aSupplier[SUP_ISUPPNO],
                                        IKSNO: aSupplier[SUP_IKSNO],
                                        ACCDAY: aSupplier[SUP_ACCDAY],
                                        APPEDATE1: aSupplier[SUP_APPEDATE1],
                                        APPEDATE3: aSupplier[SUP_APPEDATE3])
                allSuppliers.append(supplier)
            }
        }catch {
            print("loadSupplierInfo failed")
        }
        completionHandler(allSuppliers)
    }
    
    func insertFavoriteInfo(id: String, type: String, no: String) -> Bool {
        do {
            let insert = favoriteTable.insert(FAV_id <- id,
                                              FAV_datatype <- type,
                                              FAV_appno <- no)
            if try db!.run(insert) > 0 {
                return true
            }
        } catch {
            print("insertFavoriteInfo error: \(error.localizedDescription)")
        }
        return false
    }
    
    func deleteFavoriteInfo(id: String, type: String) -> Bool {
        do {
            let select = favoriteTable.filter(FAV_id == id && FAV_datatype == type)
            let delete = select.delete()
            if try db!.run(delete) > 0 {
                return true
            }
        } catch {
            print("deleteFavoriteInfo error: \(error.localizedDescription)")
        }
        return false
    }
    
    func favoriteDataIsExist(id: String, type: String) -> Bool {
        let select = favoriteTable.filter(FAV_id == id)
        do {
            let count = try db!.scalar(select.where(FAV_datatype == type).count)
            if count > 0 {
                return true
            }
        } catch {
            print("favoriteDataIsExist error")
        }
        return false
    }
}


extension Connection {
    public var userVersion: Int32 {
        get { return Int32(try! scalar("PRAGMA user_version") as! Int64)}
        set { try! run("PRAGMA user_version = \(newValue)") }
    }
}
