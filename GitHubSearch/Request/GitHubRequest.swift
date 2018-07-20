//
//  GitHubRequest.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    var baseURL: URL{get}
    var path: String{get}
    var method: HTTPMethod{get}
    var queryItems: [URLQueryItem]{ get}
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}
