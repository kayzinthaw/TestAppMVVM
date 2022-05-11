//
//  String.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import BCryptSwift

extension String {
    static func sortByKey(datadictionary: [String:String])-> String {
        let sortedDictKeys = datadictionary.sorted( by: { $0.0 < $1.0 })
        print("Sorted Dictionary Data is : \(sortedDictKeys)")
        var sortedString = ""
        for i in sortedDictKeys {
            sortedString += i.key + "=" + i.value + "&"
        }
        return sortedString
        
    }
    
    static func generateHashByBCrypt(dataString: String) -> String {
        var hashed: String?
        do {
            let salt = try BCryptSwift.generateSalt()
             hashed = try BCryptSwift.hashPassword(dataString, withSalt: salt)
            print("Hashed result  is:" + hashed!)
            return hashed!
        } catch {
            print("An error occured: \(error)")
        }
    }
}
