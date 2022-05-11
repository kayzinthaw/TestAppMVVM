//
//  BaseService.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import RxSwift
import Alamofire
import EVReflection

enum HTTPMETHOD : String{
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}
class BaseService {
    typealias Completion<T> = (_ result:T?, _ error: ApplicationError?) -> Void
    var baseDomain:String = "baseDomain";
    
    func request<T>(_ urlString: String,
                    method: HTTPMethod,
                    params: Parameters,
                    encoding: ParameterEncoding,
                    completion: @escaping (WSResponse<T>?, ApplicationError?) -> Void)-> DataRequest? {
        var headers : [String:String] = [:]
//        print("Access Token ",     getAppDelegate().applicationData?.accessToken)
        
        if (getAppDelegate().applicationData?.accessToken == nil || getAppDelegate().applicationData?.accessToken == "") {
            headers["client_id"] = CLIENT_ID
            print("Client ID ", CLIENT_ID)
        }
        if let accessToken = getAppDelegate().applicationData?.accessToken {
            headers["access_token"] = accessToken
            print("AccessToken ", accessToken)
        }
        
        if(!Reachability.isConnectedToNetwork()) {
            completion(nil,ApplicationError(domain: self.baseDomain, code: 111, message: "No Internet Connection"))
        }
        
        return Alamofire.request(buildURL(url: urlString), method: method, parameters: params, encoding: encoding, headers: headers)
             .responseObject { (response: DataResponse<WSResponse<T>>) in
                 if let err = self.preProcessResponse(result: response){
                     completion(nil, err);
                 }
                 else {
                     completion(response.result.value, nil);
                 }
             }
        
    }
    
    func preProcessResponse<H>(result: DataResponse<WSResponse<H>>)->ApplicationError?{
        var applicationError:ApplicationError?;
        if let err = result.result.error {
            applicationError = self.convertErrorToApplicationError(error: err, domain: self.baseDomain);
        }
        
        else if let res = result.result.value {
            if res.result?.resultCode != "000" {
                if let message = res.result?.resultDescription {
                    applicationError = ApplicationError(domain: self.baseDomain, code: Int(res.result!.resultCode)!, message: message);
                }
                else{
                    applicationError = ApplicationError(domain: self.baseDomain, code: 999, message: "System Error");
                }
            } else if let responselogin = res.response as? LoginResponse, responselogin.accessToken != nil {
                
                getAppDelegate().applicationData?.accessToken = responselogin.accessToken;
                getAppDelegate().applicationData?.archiveAccessToken();
            }
            
        }
        return applicationError;
    }
    func convertErrorToApplicationError(error:Error, domain:String) -> ApplicationError{
        return ApplicationError(domain:domain, code:999, message: error.localizedDescription);
    }
    
    func convertToApplictionErrorFromMessage(message:String, domain:String) -> ApplicationError{
        return ApplicationError(domain: domain, code: 999, message: message);
    }
    
}
