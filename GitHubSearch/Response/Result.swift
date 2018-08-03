//
//  Result.swift
//  GitHubSearch
//
//  Created by H5266 on 2018/08/03.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)

    init(value: T) {
        self = .success(value)
    }

    init(error: Error) {
        self = . failure(error)
    }
}
