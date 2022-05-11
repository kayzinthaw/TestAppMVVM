//
//  AppController.swift
//  TestAppMVVM
//
//  Created by May Phoo on 02/05/2022.
//

import UIKit
import ProgressHUD

class AppController: UIViewController {
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        ProgressHUD.dismiss()
    }
}
// MARK: - UIAlertController methods
extension AppController {
    func present(error: Error, customAction: UIAlertAction? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            self.present(title: "", message: error.localizedDescription)
        }
    }
    
    func present(title: String, message: String, customAction: UIAlertAction? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        if let customAction = customAction {
            alert.addAction(customAction)
        }
        
        present(alert, animated: true)
    }
}

// MARK: - Progress Dialog methods
extension AppController {
    func startLoading() {
//        ProgressHUD.show()
//        self.view.isUserInteractionEnabled = false
        
        blurEffectView.frame = self.view.frame
        view.addSubview(blurEffectView)
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        indicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        
    }

    func stopLoading() {
//        self.view.isUserInteractionEnabled = true
//        ProgressHUD.dismiss()
        
        blurEffectView.removeFromSuperview()
        indicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
}
