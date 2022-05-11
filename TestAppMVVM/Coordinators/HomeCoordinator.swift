////
////  HomeCoordinator.swift
////  TestAppMVVM
////
////  Created by May Phoo on 02/05/2022.
////
//
//import Foundation
//import UIKit
//protocol HomeCoordinatorDelegate: class {
//    func homeCoordinatorDidFinish(homeCoordinator: HomeCoordinator)
//}
//class HomeCoordinator: RootViewCoordinator {
//    var childCoordinators: [Coordinator] = []
//    var rootViewController: UIViewController {
//        return self.navigationController
//    }
//    weak var delegate: HomeCoordinatorDelegate?
//    var window: UIWindow
//
//    init(window: UIWindow) {
//        self.window = window
//    }
//    private var navigationController: UINavigationController = {
////        let viewModel = AuthenticateViewModel()
//        let viewController = HomeViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        return navigationController
//    }()
//
//    func start() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController {
////            let viewModel =  HomeViewModel()
////            viewModel.model = MVVMCDetailModel(detailItem: dataItem)
////            viewModel.coordinatorDelegate = self
////            vc.viewModel = viewModel
//            window.rootViewController = vc
//        }
//    }
//}
