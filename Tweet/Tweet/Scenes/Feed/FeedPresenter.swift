//
//  FeedPresenter.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
    func reloadTableView()
    func moveToTweetViewController(with tweet: Tweet)
}

final class FeedPresenter: NSObject {
    private weak var viewController:
    FeedProtocol?
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var tweets: [Tweet] = []
    
    init(viewController: FeedProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
}

extension FeedPresenter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as! FeedTableViewCell
        
        let tweet = Tweet(user: User.shared, contents: "안녕하세요")
        cell.setup(tweet: tweet)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let tweet = tweets[indexPath.row]
        viewController?.moveToTweetViewController(with: tweet)
    }
   
}


