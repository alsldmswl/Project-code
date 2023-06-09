//
//  TodayCollectionViewHeader.swift
//  AppStoreStyle
//
//  Created by eun-ji on 2023/03/26.
//

import UIKit
import SnapKit

final class TodayCollectionViewHeader: UICollectionReusableView{
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "6월 28일 월요일"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36, weight: .black)
        label.textColor = .label
        return label
    }()
    
    func setupViews() {
        [dateLabel, titleLable].forEach{addSubview($0)}
        dateLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
            
        }
        
        titleLable.snp.makeConstraints{
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
    }
}
