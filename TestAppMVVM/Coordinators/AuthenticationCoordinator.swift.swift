////
////  AuthenticationCoordinator.swift.swift
////  TestAppMVVM
////
////  Created by May Phoo on 02/05/2022.
////
//
//import Foundation
//import UIKit
//
//
//class AuthenticationCoordinator: RootViewCoordinator {
////    weak var delegate: AuthenticationCoordinatorDelegate?
//    var childCoordinators: [Coordinator] = []
//    var homeCoordinator: HomeCoordinator?
//    var rootViewController: UIViewController {
//        return self.navigationController
//    }
//    
//    private var navigationController: UINavigationController = {
//        let viewModel = AuthenticateViewModel()
//        let viewController = AuthenticationViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        return navigationController
//    }()
//    
//    var window: UIWindow
//    init(window: UIWindow) {
//        self.window = window
//    }
//    var homeViewController: HomeViewController?
//    // MARK: - Functions
//    
//    
//    func start() {
//        let homeCoordinator = HomeCoordinator(window: window)
//        addChildCoordinator(homeCoordinator)
////        setCurrentCoordinator(homeCoordinator)
////        let storyboard = UIStoryboard(name: "TestApp", bundle: nil)
////        if let vc = storyboard.instantiateViewController(withIdentifier: "Authentication") as? AuthenticationViewController {
////            let viewModel =  AuthenticateViewModel()
//////            viewModel.model = MVVMCAuthenticateModel()
//////            viewModel.coordinatorDelegate = self
//////            vc.viewModel = viewModel
////            window.rootViewController = vc
////        }
//    }
//}
//
