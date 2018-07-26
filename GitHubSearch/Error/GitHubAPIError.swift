//
//  GitHubAPIError.swift
//  GitHubSearch
//
//  Created by H5266 on 2018/07/26.
//  Copyright © 2018年 福田走. All rights reserved.
//

struct GitHubAPIError: Decodable, Error {
    struct FieldError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
    let message: String
    let fieldErrors: [FieldError]
}
