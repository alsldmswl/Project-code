//
//  Icon.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import UIKit

enum Icon {
    case message
    case like
    case share
    case write
    
    var image: UIImage? {
        let systemName: String
        
        switch self {
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .like:  systemName = "heart"
        case .write: systemName = "squre.and.pencil"
        }
        
        return UIImage(systemName: systemName)
    }
}
