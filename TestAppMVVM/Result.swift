//
//  Result.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
enum Result<T,Error> {
    case Success(T)
    case Failure(Error)
}
enum EmptyResult<Error> {
    case Success
    case Failure(Error)
}
