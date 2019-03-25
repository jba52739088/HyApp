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
    
    private let CUST_id = Expression<Int>("id")
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
    
//    func insertBookInfo(_ book: Book) -> Bool {
//        do {
//            let insert = bookTable.insert(book_name <- book.name,
//                                          book_level <- book.level,
//                                          book_downloaded <- book.isDownloaded,
//                                          book_completion <- book.completion)
//            if try db!.run(insert) > 0 {
//                return true
//            }
//        } catch {
//            print("Insert Book error: \(error.localizedDescription)")
//        }
//        return false
//    }
    
    
}


extension Connection {
    public var userVersion: Int32 {
        get { return Int32(try! scalar("PRAGMA user_version") as! Int64)}
        set { try! run("PRAGMA user_version = \(newValue)") }
    }
}
