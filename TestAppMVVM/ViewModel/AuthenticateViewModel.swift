//
//  AuthenticateViewModel.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AuthenticateViewModel {
    weak var delegate: RequestDelegate?
    private var state: ViewState {
        didSet {
            self.delegate?.didUpdate(with: state)
        }
    }
    init() {
        self.state = .idle
    }
    
    private let disposeBag = DisposeBag()
    var sortedString: String?
    var hashed: String = ""
    let userService = UserService()
  
    var email: String?
    var password: String?
    //1
    // Create subjects/observable
    let emailSubject = BehaviorRelay<String?>(value: "")
    let passwordSubject = BehaviorRelay<String?>(value: "")
    //2
    // Observable - combine few conditions
    var isValidForm: Observable<Bool> {
            // check if email is valid not empty
            // check if password is valid not empty
            return Observable.combineLatest( emailSubject, passwordSubject) { email, password in
                guard email != nil && password != nil else {
                    return false
                }
                // Conditions:
                // email is not empty
                // password is not empty
                return !(email!.isEmpty) && !(password!.isEmpty)
            }
    }
}

// MARK: - Service
extension AuthenticateViewModel {

    func submitLogin() {
        print("Call Login")
        self.state = .loading
        guard let email = email else {
            return
        }
        guard let password = password else {
            return
        }
//        Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//                .subscribe(onNext: { [self] _ in
        DispatchQueueHelper.delay(bySeconds: 1.0, dispatchLevel: .main) { [self] in
                    var userdictionary =  [String:String]()
                    userdictionary.updateValue(email, forKey: "username")
                    userdictionary.updateValue(password, forKey: "password")
                    // sort the user dictionary
                    sortedString = String.sortByKey(datadictionary: userdictionary)
                    // sorted string with secret key
                    sortedString! += SECRET_KEY + "=" + SECRET_VALUE
                    print("Sorted String with SECRET KEY : " + sortedString!)
                    // generate hash by using bcrypt
                    hashed = String.generateHashByBCrypt(dataString: sortedString!)
                    print("Client ID" , CLIENT_ID)
                    userService.processLogin(email: email, password: password, hashed: hashed) { (response, err) in
                        if(err?.code == nil) {
                            getAppDelegate().applicationData?.accessToken = response?.accessToken
                            getAppDelegate().applicationData?.archiveAccessToken()
                            getAppDelegate().applicationData?.currentUser = response?.user
                            getAppDelegate().applicationData?.archiveUser()
                            print("Login Success")
                            self.state = .success
//                            self.coordinatorDelegate?.authenticateViewModelDidLogin(viewModel: self)
                            
                        } else {
                            self.state = .error(err)
                        }
                    }
        }
//                })
//                .disposed(by: disposeBag)
     
    }
}
