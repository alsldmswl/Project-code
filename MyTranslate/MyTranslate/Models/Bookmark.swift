//
//  Bookmark.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Foundation

struct Bookmark: Codable {
    let sourceLanguage: Language
    let translatedLaguage: Language
    let sourceText: String
    let traslatedText: String
    
}

