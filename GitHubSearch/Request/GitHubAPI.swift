//
//  GitHubAPI.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

final class GitHubAPI {
    struct SearchRepositories: GitHubRequest{
        let keyword: String
        typealias Response = SearchResponse<Repository>
        
        var path: String { return "/search/repositories" }
        
        var method: HTTPMethod { return .get }
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "q", value: keyword)]
        }
        
    }
}
