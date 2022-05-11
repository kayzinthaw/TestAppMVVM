//
//  Configs.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import UIKit

// BASE URL
let BASE_URL = "http://10.80.4.29:4421/send2cb/uat/rest/"

// Client ID
var CLIENT_ID = "aaa4831b-5470-415b-b0af-80e1a28cef43";
// Secret KEY Value
let SECRET_KEY = "secret"
let SECRET_VALUE = "2F95D271A14B6547DDB5C0D4E8AA21BE";
// build URL
func buildURL(url: String)-> String {
    return "\(BASE_URL)\(url)"
}
func getAppDelegate() -> AppDelegate{
    return UIApplication.shared.delegate as! AppDelegate;
}
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
func getDocumentFolder() -> String{
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
}
func makeDocumentPath(filename : String) -> String{
    let documentFolder = getDocumentFolder();
    return "\(documentFolder)/\(filename)";
}
enum Variable: String {
    case appName = "APP_NAME"
    case appBundleID = "APP_BUNDLE_ID"
}
 func getValue(forKey key: Variable) -> String {
    return infoForKey(key.rawValue)
}

private  func infoForKey(_ key: String) -> String {
    guard let value = (Bundle.main.infoDictionary?[key] as? String) else {
        fatalError("Could not get value for key: \(key)")
    }
    return value.replacingOccurrences(of: "\\", with: "")
}
