//
//  Feature.swift
//  AppStoreStyle
//
//  Created by eun-ji on 2023/03/26.
//

import Foundation

struct Feature: Decodable{
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
