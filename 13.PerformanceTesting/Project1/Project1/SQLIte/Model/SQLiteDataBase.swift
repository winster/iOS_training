//
//  SQLiteDataBase.swift
//  SqliteDemo
//
//  Created by Priyank Ranka on 26/08/14.
//  Copyright (c) 2014 Nimap Infotech. All rights reserved.
//

import UIKit

class SQLiteDataBase: NSObject {
    
    var database:COpaquePointer = nil
    var writableDBPath:String?
    
    init(dbFileName fileName:String, deleteEditableCopy isDelete:Bool)
    {
        super.init()
        
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask, true)
        let documentDirectoryPath = paths[0] as String
        
        
        writableDBPath  =   documentDirectoryPath + "/" + fileName
        
        let fileManager =   NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(writableDBPath!)
        {
            //The DB file does not exist inside the Document Directory than copy from Bundle to the document directory
            
            let bundleDBPath =  NSBundle.mainBundle().resourcePath! + "/" + fileName
            
            var error: NSError?
            
            do {
                try fileManager.copyItemAtPath(bundleDBPath, toPath: writableDBPath!)
            } catch let error1 as NSError {
                error = error1
                print("db can not be copied to document directory \(error!.description)")
            }
        }
        
        //writableDBPath  =   NSBundle.mainBundle().resourcePath! + "/" + fileName
        
        print("writableDBPath:  \(writableDBPath)")
    }
    
    func initializeStatement(inout sqlStatement statement:COpaquePointer,query sqlQuery:String) -> Bool
    {
    
        if(statement == nil)
        {
            if sqlite3_prepare_v2(database, (sqlQuery as NSString).UTF8String, -1,&statement, nil) != SQLITE_OK
            {
                print("Error while preparing statment \(sqlite3_prepare_v2(database,(sqlQuery as NSString).UTF8String, -1,&statement, nil))")
                return false
            }
        }
        
        return true
    }
    
    // Convenience function to execute DELETE, UPDATE, and INSERT statements.
    func executeUpdate(sqlStatement statement:COpaquePointer) -> Bool
    {
        let resultCode = executeStatement(sqlStatement: statement, success:Int(SQLITE_DONE))
        sqlite3_reset(statement)
        return resultCode
    }
    // Convenience function to execute SELECT statements.You must call sqlite3_reset after you're done.
    
    func executeSelect(sqlStatement statement:COpaquePointer) -> Bool
    {
        return executeStatement(sqlStatement: statement, success: Int(SQLITE_ROW))
    }

    // Convenience function to execute COUNT statements.You must call sqlite3_reset after you're done.
    func executeCount(sqlStatement statement:COpaquePointer) -> Bool
    {
        return executeStatement(sqlStatement: statement, success: Int(SQLITE_ROW))
    }

    func executeStatement(sqlStatement statement:COpaquePointer,success successConstant:Int) -> Bool
    {
        let success = Int(sqlite3_step(statement))
        
        if success != successConstant
        {
            print("Statement \(successConstant) failed with error \(success)")
            return false
        }
        
        return true
    }
    
    func executeQuery(sqlStatement statement:COpaquePointer) ->Bool
    {
        let resultCode = executeStatement(sqlStatement: statement, success: Int(SQLITE_DONE))
        
        sqlite3_reset(statement)
        
        return resultCode
    }
    
}
