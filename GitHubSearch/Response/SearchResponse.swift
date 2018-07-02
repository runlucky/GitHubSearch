//
//  SearchResponse.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

struct SearchResponse<T: Decodable>: Decodable {
    let totalCount: Int
    let items: [T]
    
    enum CodingKeys: String, CodingKey{
        case totalCount = "totai_count"
        case items
        
        
    }
}
