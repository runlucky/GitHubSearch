//
//  GitHubRequest.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    associatedtype Response: Decodable

    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    // var body: Encodable? { get }
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        switch method {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }

        var request = URLRequest(url: url)
        request.url = components?.url
        request.httpMethod = method.rawValue

        return request
    }

    func response (from data: Data, urlResponse: URLResponse) throws -> Response {
        let decoder = JSONDecoder()

        if case(200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try decoder.decode(Response.self, from: data)
        } else{
            return try decoder.decode(GitHubAPIError.self, from: data)
        }
    }
}
