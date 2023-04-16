//
//  FeedViewController.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import Floaty
import UIKit
import SnapKit

final class FeedViewController: UIViewController{
    
    private lazy var presenter = FeedPresenter(viewController: self)
    
    private lazy var writeButton: Floaty = {
        let floaty = Floaty(size: 50)
        floaty.sticky = true
        floaty.handleFirstItemDirectly = true // 세부버튼 설정 x
        floaty.addItem(title: "") { _ in
            print("floaty")
            
        }
        floaty.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return floaty
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension FeedViewController: FeedProtocol {
    func setupView() {
        navigationItem.title = "Feed"
        
        [tableView, writeButton].forEach{
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        writeButton.paddingY = 100
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func moveToTweetViewController(with tweet: Tweet) {
        let tweetViewController = TweetViewController(tweet: tweet)
        navigationController?.pushViewController(tweetViewController, animated: true)
    }
}
