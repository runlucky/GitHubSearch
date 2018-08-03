//
//  GitHubClient.swift
//  GitHubSearch
//
//  Created by H5266 on 2018/08/03.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

class GitHubClient {
    private let session: URLSession = {
        return URLSession(configuration: URLSessionConfiguration.default)
    }()

    func send<Request: GitHubRequest>(request: Request, completion: (Result<Request.Response, GitHubClientError>) -> Void) {

    }
}
