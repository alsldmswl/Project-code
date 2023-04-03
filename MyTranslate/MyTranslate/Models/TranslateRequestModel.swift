//
//  TranslateRequestModel.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Foundation

struct TranslateRequestModel: Codable {
    let source: String
    let target: String
    let text: String
}
