//
//  ApplicationError.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
class ApplicationError : NSError{
    var message:String{
        get{
            if(!self.localizedDescription.isEmpty){
                return self.localizedDescription;
            }
            else{
                return "Unknown Error";
            }
        }
        set{
            var info:Dictionary = self.userInfo as! Dictionary<String, String>;
            info[NSLocalizedDescriptionKey] = newValue;
        }
    };
    
    init(domain: String, code: Int, message: String) {
        let userInfo = [ NSLocalizedDescriptionKey : message];
        super.init(domain: domain, code: code, userInfo: userInfo);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
