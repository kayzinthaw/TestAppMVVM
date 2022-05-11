//
//  UserService.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import Alamofire

class UserService: BaseService {
    private let loginUrl: String = "user/authentication" // login
    
    typealias Completion<T> = (_ result:T?, _ error: ApplicationError?) -> Void
    
     func processLogin(email:String, password:String, hashed: String, completion:@escaping Completion<LoginResponse>) {
        let params:Parameters = [
            "username": "\(email)",
            "password": "\(password)",
            "hash": "\(hashed)"
        ]
        _ = request(loginUrl, method: HTTPMethod.post, params: params, encoding: URLEncoding.default) { (res: WSResponse<LoginResponse>?, err:ApplicationError?) in
            completion(res?.response, err)
        }
    }
}
