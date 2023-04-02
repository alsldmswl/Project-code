//
//  User.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import Foundation

struct User {
    let username: String
    let account: String
    
    static let shared = User(username: "패캠", account: "fast.campus")
}
