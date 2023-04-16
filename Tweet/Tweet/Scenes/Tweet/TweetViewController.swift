//
//  TweetViewController.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import UIKit

final class TweetViewController: UIViewController {
    private var presenter: TweetPresenter!
    
    init(tweet: Tweet) {
        super.init(nibName: nil, bundle: nil)
        presenter = TweetPresenter(viewController: self, tweet: tweet)
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TweetViewController: TweetProtocol {
    
}
