//
//  WSResponse.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import EVReflection
class Meta: EVNetworkingObject {
    var resultCode: String!
    var resultDescription: String!
    var versionNo: String!
}
class WSResponse<T:NSObject>: EVNetworkingObject,EVGenericsKVC {
    var result: Meta?;
    var response:T?;
    var responseAsList:[T]?
    var error:T?;
    
    func setGenericValue(_ value: AnyObject!, forUndefinedKey key: String){
        
        switch key {
        case "response":
            response = value as? T
            if response == nil{
                responseAsList = value as? [T]
            }
            print("Response :: '\(response)'")
            print("Meta :: '\(result?.resultCode)'")
        case "error":
            error = value as? T
            if error == nil{
                responseAsList = value as? [T]
            }
            print("Meta :: \(result?.resultCode)")
        default:
            print("---> setValue '\(value)' for key '\(key)' should be handled.")
        }
    }
    func getGenericType() -> NSObject{
        return T.init();
    }
}
