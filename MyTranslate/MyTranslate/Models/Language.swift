//
//  Language.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case ko
    case en
    case ja
    case ch = "zn-CN"
    
    var title: String {
        switch self {
        case .ko: return "Korean"
        case .en: return "English"
        case .ja: return "Japanese"
        case .ch: return "Chinese"
        }
    }
    
    var languageCode: String {
        self.rawValue
    }
}
