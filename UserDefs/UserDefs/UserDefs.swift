//
//  UserDefs.swift
//  UserDefs
//
//  Created by Garret Kielburger on 2021-09-30.
//

import Foundation

public struct UserDefs {
    
    // MARK: Customize from Direct Methods to make life easier
    
    static func saveName(name: String) {
        saveStringInDefaults(value: name, key: Constant.name)
    }
    static func fetchName() -> String {
        return fetchStringFromDefaults(key: Constant.name)
    }
    
    static func saveTime(over: Date) {
        saveDateInDefaults(value: over, key: Constant.date)
    }
    static func fetchTime() -> Date {
        return fetchDateFromDefaults(key: Constant.date)
    }
    
    // MARK: Direct UserDefault Methods

    //******************* SAVE STRING IN USER DEFAULT *******************
    static func saveStringInDefaults(value:String,key:String) {
     UserDefaults.standard.setValue(value, forKey: key);
    }

    //******************* SAVE INT IN USER DEFAULT *******************
    static func saveIntInDefaults(value:Int,key:String) {
     UserDefaults.standard.setValue(value, forKey: key);
    }

    //******************* SAVE DATE IN USER DEFAULT *******************
    static func saveDateInDefaults(value:Date,key:String) {
     UserDefaults.standard.set(value, forKey: key);
    }

    //******************* FETCH STRING FROM USER DEFAULT *******************
    static func fetchStringFromDefaults(key:String) -> String {
        if (UserDefaults.standard.object(forKey: key) != nil) {
            return UserDefaults.standard.string(forKey: key)!;
        }
         else {
            return "" as String;
        }
    }

    //******************* FETCH INT FROM USER DEFAULT *******************
    static func fetchIntFromDefaults(key:String) -> Int {
        if (UserDefaults.standard.object(forKey: key) != nil) {
            return UserDefaults.standard.integer(forKey: key);
        }
         else {
            return -1;
        }
    }

    //******************* FETCH DATE FROM USER DEFAULT *******************
    static func fetchDateFromDefaults(key:String) -> Date {
        if (UserDefaults.standard.object(forKey: key) != nil) {
            return (UserDefaults.standard.object(forKey: key) as? Date)!;
        }
         else {
            return Date();
        }
    }

    // MARK: User Default Constants
    private enum Constant {
        
        static let name = "NAME"
        static let date = "DATE"
        
    }
    
    
}
