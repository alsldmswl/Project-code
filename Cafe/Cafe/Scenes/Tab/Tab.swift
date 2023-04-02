//
//  Tab.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

enum Tab {
    case home
    case other
    
    var TextItem: Text {
        switch self {
        case .home: return Text("Home")
        case .other: return Text("Other")
        }
    }
    
    var imageItem: Image {
        switch self {
        case .home: return Image(systemName: "house.fill")
        case .other: return Image(systemName: "ellipsis")
        }
    }
}
