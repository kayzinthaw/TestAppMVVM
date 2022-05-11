////
////  RootViewCoordinator.swift
////  TestAppMVVM
////
////  Created by May Phoo on 30/04/2022.
////
//
//import Foundation
//import UIKit
//
//public protocol RootViewControllerProvider: AnyObject {
//    // The coordinators 'rootViewController'. It helps to think of this as the view
//    // controller that can be used to dismiss the coordinator from the view hierarchy.
//    var rootViewController: UIViewController { get }
//    func start()
//}
//
///// A Coordinator type that provides a root UIViewController
//public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
