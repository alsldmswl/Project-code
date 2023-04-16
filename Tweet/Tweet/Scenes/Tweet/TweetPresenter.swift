//
//  TweetPresenter.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import Foundation

protocol TweetProtocol: AnyObject {
    
}

final class TweetPresenter {
    private weak var viewController: TweetProtocol?
    private let tweet: Tweet
    
    init(viewController: TweetProtocol, tweet: Tweet ) {
        self.viewController = viewController
        self.tweet = tweet
    }
}
