//
//  Type.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import UIKit

enum `Type` {
    case source
    case target
    
    var color: UIColor {
        switch self {
        case .source: return .label
        case .target: return .mainTintColor
        }
    }
}
