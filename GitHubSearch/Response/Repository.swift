//
//  Repository.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

struct Repository : Decodable {
    let id : Int
    let name: String
    let fullName: String
    let owner: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "funn_name"
        case owner
    }
}
