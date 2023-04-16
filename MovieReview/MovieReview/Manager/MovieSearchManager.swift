//
//  MovieSearchManager.swift
//  MovieReview
//
//  Created by eun-ji on 2023/04/16.
//

import Alamofire
import Foundation

protocol MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void)
}

struct MovieSearchManager: MovieSearchManagerProtocol {
    func request(from keyword: String, completionHandler: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/movie.json") else {return}
        
        let parameters = MovieSearchRequest(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "VCgI64Ba084th1VwaY3r",
            "X-Naver-Client-Secret" : "N2Tq4LxJdq"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: MovieSearchResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
}
