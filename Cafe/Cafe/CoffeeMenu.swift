//
//  CoffeeMenu.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

struct CoffeeMenu: Identifiable {
    let image: Image
    let name: String
    let id = UUID()
    
    static let sample: [CoffeeMenu] = [
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "아이스 카페라떼"),
        CoffeeMenu(image: Image("coffee"), name: "아메리카노"),
        CoffeeMenu(image: Image("coffee"), name: "아메리카노")
       
    ]
}
