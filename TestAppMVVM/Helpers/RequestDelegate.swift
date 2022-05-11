//
//  RequestDelegate.swift
//  TestAppMVVM
//
//  Created by May Phoo on 02/05/2022.
//

import Foundation
protocol RequestDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}
