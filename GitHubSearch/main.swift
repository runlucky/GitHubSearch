//
//  main.swift
//  GitHubSearch
//
//  Created by 福田走 on 2018/07/02.
//  Copyright © 2018年 福田走. All rights reserved.
//

import Foundation

print("enter your query:", terminator: "")

guard let keyword = readLine(strippingNewline: true) else {
    exit(1)
}

let client = GitHubClient()

let request = GitHubAPI.SearchRepositories(keyword: keyword)

client.send(request: request) { result in
    switch result {
    case let .success(response):
        for item in response.items {
            print (item.owner.login + "/" + item.name)
        }
        exit(0)

    case let .failure(error):
        print(error)
        exit(1)
    }
}

Thread.sleep(forTimeInterval: 60)
print("timeout")
exit(1)
