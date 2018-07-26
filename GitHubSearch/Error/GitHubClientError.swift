//
//  GitHubClientError.swift
//  GitHubSearch
//
//  Created by H5266 on 2018/07/26.
//  Copyright © 2018年 福田走. All rights reserved.
//

enum GitHubClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(Error)
}
