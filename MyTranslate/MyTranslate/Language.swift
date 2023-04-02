//
//  Language.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Foundation

enum Language: CaseIterable {
    case ko
    case en
    case ja
    case ch
    
    var title: String {
        switch self {
        case .ko: return "Korean"
        case .en: return "English"
        case .ja: return "Japanese"
        case .ch: return "Chinese"
        }
    }
}
