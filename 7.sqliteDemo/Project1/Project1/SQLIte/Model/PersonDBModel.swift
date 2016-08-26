//
//  PersonDBModel.swift
//  Project2
//
//  Created by Priyank Ranka on 04/02/15.
//  Copyright (c) 2015 Nimap Infotech. All rights reserved.
//

import UIKit

// sqlite3_stmt

class PersonDBModel: SQLiteDataBase {
    
    var insertPerson : COpaquePointer = nil
    var updatePerson : COpaquePointer = nil
    var deletePerson : COpaquePointer = nil
    var selectPerson : COpaquePointer = nil
    
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : PersonDBModel? = nil
    }
    
    class func sharedInstance() -> PersonDBModel!{
        
        dispatch_once(&Static.onceToken) {
            Static.instance = PersonDBModel()
        }
        
        return Static.instance
    }
    
    private init()
    {
        
        super.init(dbFileName: "persondb.sqlite", deleteEditableCopy: false)
        
        if sqlite3_open((writableDBPath! as NSString).UTF8String, &database) == SQLITE_OK{
            
            initializeStatement(sqlStatement: &insertPerson, query: "INSERT INTO person (pid,pname) VALUES (?,?)")
            initializeStatement(sqlStatement: &updatePerson, query: "UPDATE person SET pname = ? WHERE pid = ?")
            initializeStatement(sqlStatement: &deletePerson, query: "DELETE FROM person WHERE pid = ?")
            initializeStatement(sqlStatement: &selectPerson, query: "SELECT * FROM person")
            
        }
    }
    
    func insertIntoPerson(pid pid : Int, pname : String) -> Bool{
        
        sqlite3_bind_int(insertPerson, 1, CInt(pid))
        sqlite3_bind_text(insertPerson, 2, (pname as NSString).UTF8String, -1, nil)
        
        return executeUpdate(sqlStatement: insertPerson)
    }
    
    func updatePersonWith(pid pid : Int, pname : String) -> Bool{
        
        sqlite3_bind_text(updatePerson, 1, (pname as NSString).UTF8String, -1, nil)
        sqlite3_bind_int(updatePerson, 2, CInt(pid))
        
        return executeUpdate(sqlStatement: updatePerson)
    }
    
    func deletePersonWith(pid pid : Int)-> Bool{
        sqlite3_bind_int(deletePerson, 1, CInt(pid))
        
        return executeUpdate(sqlStatement: deletePerson)
    }
    
    func selectAllFromPerson() -> [PersonModel]{
        
        var persons : [PersonModel] = []
        
        while executeSelect(sqlStatement: selectPerson){
            
            let person = PersonModel()
            
            person.pid = Int(sqlite3_column_int(selectPerson, 0))
            
            let name = sqlite3_column_text(selectPerson, 1)
            let uStringPtr  =   UnsafePointer<Int8>(name)
            person.pname    =    String.fromCString(uStringPtr)
            
            persons.append(person)
        }
        
        sqlite3_reset(selectPerson)
        
        return persons
    }
    
    
    
    
    
    
    

}
