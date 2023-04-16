//
//  Movie.swift
//  MovieReview
//
//  Created by eun-ji on 2023/04/16.
//

import Foundation

struct Movie: Decodable {
    let title: String
    private let image: String
    let userRating: String
    let actor: String
    let director: String
    let pubDate: String
    
    var imageURL: URL? {URL(string: image)}
}
