//
//  FeedTableViewCell.swift
//  Tweet
//
//  Created by eun-ji on 2023/04/09.
//

import SnapKit
import UIKit

final class FeedTableViewCell: UITableViewCell {
    static let identifier = "FeedTableViewCell"
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 21
        return imageView
    }()
    
    private lazy var writterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var writterAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.message.image, for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        return button
    }()
    
    func setup(tweet: Tweet) {
        setupLayout()
        selectionStyle = .none
        writterNameLabel.text = tweet.user.name
        writterAccountLabel.text = "@\(tweet.user.accout)"
        contentsLabel.text = tweet.contents
    }
}

private extension FeedTableViewCell {
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [profileImageView, writterNameLabel, writterAccountLabel, contentsLabel, buttonStackView].forEach{ addSubview($0) }
        
        let superviewMargin: CGFloat = 16
        
        profileImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(superviewMargin)
            $0.top.equalToSuperview().inset(superviewMargin)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        }
        
        writterNameLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImageView.snp.trailing).offset(superviewMargin)
            $0.top.equalTo(profileImageView.snp.top)
        }
        
        writterAccountLabel.snp.makeConstraints{
            $0.leading.equalTo(writterNameLabel.snp.trailing).offset(2)
            $0.bottom.equalTo(writterNameLabel.snp.bottom)
        }
        
        contentsLabel.snp.makeConstraints{
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.top.equalTo(writterNameLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(superviewMargin)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.trailing.equalTo(contentsLabel.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(superviewMargin)
        }
    }
}
