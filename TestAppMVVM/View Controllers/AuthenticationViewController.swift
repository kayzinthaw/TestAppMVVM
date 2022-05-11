//
//  AuthenticationViewController.swift
//  TestAppMVVM
//
//  Created by May Phoo on 02/05/2022.
//

import UIKit
import RxSwift

class AuthenticationViewController: AppController {
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
            passwordTextField.addTarget(self, action:
                                            #selector(passwordTextFieldDidChange),
                                        for: .editingChanged)
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
            emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange),
                                     for: .editingChanged)
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    private var viewModel = AuthenticateViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // cosmetics
        loginButton.setTitleColor(.gray, for: .disabled)
        // rx
        setupBindings()
        //        self.viewModel = AuthenticateViewModel()
        self.viewModel.delegate = self
        navigationItem.largeTitleDisplayMode = .always
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    @objc
    func passwordTextFieldDidChange(textField: UITextField){
        viewModel.password = textField.text ?? ""
    }
    @objc
    func emailTextFieldDidChange(textField: UITextField){
        viewModel.email = textField.text ?? ""
    }
    
    func setupBindings() {
        // 3
        // bind textfields to viewModel for validation and process
        emailTextField.rx.text.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
        
        // 4
        // check if form has fulfil conditions to enable submit button
        viewModel.isValidForm.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
    @IBAction func login(_ sender: Any) {
        print("Click Login")
        viewModel.submitLogin()
    }
    
}
// MARK: - UITextFieldDelegate
extension AuthenticationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
// MARK: RequestDelegate
extension AuthenticationViewController: RequestDelegate {
    func didUpdate(with state: ViewState) {
        print("Here in call back didUpdate")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch state {
                case .idle:
                    print("Call Idle ")
                    break
                case .loading:
                    print("Call Start Loading")
                    self.startLoading()
                case .success:
                    self.stopLoading()
                    print("Call Stop Loading")
                    self.performSegue(withIdentifier: "loginIdentifier", sender: nil)
                    //                    self.coordinatorDelegate?.authenticateViewModelDidLogin(viewModel: self)
                case .error(let error):
                    print("Call Error")
                    self.stopLoading()
                    self.present(error: error!, customAction: UIAlertAction(title: error?.localizedDescription, style: .default, handler: { [weak self] _ in
                        guard let self = self else { return }
                        
                    }))
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginIdentifier"{
            let nav = segue.destination as! UINavigationController
            let nrcVC = nav.topViewController as! HomeViewController
            //            nrcVC.loginUser = (getAppDelegate().applicationData?.currentUser)!
            //            nrcVC.isFromLogin = true
            
        }
    }
    
    
}
