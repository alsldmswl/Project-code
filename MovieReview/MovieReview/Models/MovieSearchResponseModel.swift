//
//  MovieSearchResponseModel.swift
//  MovieReview
//
//  Created by eun-ji on 2023/04/16.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var items: [Movie] = []
}

