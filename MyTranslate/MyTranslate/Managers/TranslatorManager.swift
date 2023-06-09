//
//  TranslatorManager.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import Alamofire
import Foundation

struct TranslatorManager {
    var sourceLanguage: Language = .ko
    var targetLanguage: Language = .en
    
    func translate(from text: String, completionHandler: @escaping (String) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/papago/n2mt") else {return}
        
        let requestModel = TranslateRequestModel(source: sourceLanguage.languageCode, target: targetLanguage.languageCode, text: text)
        
        let headers: HTTPHeaders = [  "X-Naver-Client-Id": "TPDO0fSdHhMWbBCe9wdB",
                                      "X-Naver-Client-Secret" : "lORC6VT_YY" ]
        
        AF.request(url, method: .post, parameters: requestModel, headers: headers)
            .responseDecodable(of: TranslateResponseModel.self) { response in
                switch response.result {
                case .success(let result): completionHandler(result.translatedText)
                case .failure(let error): print(error.localizedDescription)
                }
            }
            .resume()
    }
}
