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

    func send<Request: GitHubRequest>(request: Request, completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in

            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("fatal error! :\(data), \(response), \(error)")
            }
        }
        task.resume()
    }
}
