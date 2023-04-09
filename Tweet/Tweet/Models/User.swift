//
//  User.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import Foundation

struct User: Codable {
    var name: String
    var accout: String
    
    static var shared = User(name: "iOS 개발왕", accout: "ios_developer")
}
