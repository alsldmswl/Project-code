//
//  TranslateResponseModel.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Foundation

struct TranslateResponseModel: Decodable {
   private let message: Message
    
    var translatedText: String {message.result.translatedText}
    
    struct Message: Decodable {
        let result: Result
    }
    struct Result: Decodable {
        let translatedText: String
    }
}
