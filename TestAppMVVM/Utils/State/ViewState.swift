//
//  ViewState.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
enum ViewState {
    case idle
    case loading
    case success
    case error(ApplicationError?)
}
