//
//  UserDefaultsManager.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getTweet() -> [Tweet]
    func setTweet(_ newValue: Tweet)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    enum Key: String {
        case tweet
        
        var value: String {
            self.rawValue
        }
    }
    
    
    func getTweet() -> [Tweet] {
        guard let data = UserDefaults.standard.data(forKey: Key.tweet.value) else {return []}
        return (try? PropertyListDecoder().decode([Tweet].self, from: data)) ?? []
    }
    
    func setTweet(_ newValue: Tweet) {
        var currentTweet: [Tweet] = getTweet()
        currentTweet.insert(newValue, at: 0)
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentTweet), forKey: Key.tweet.value)
    }
   
}
