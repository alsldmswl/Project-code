//
//  BookmarkCollectionViewCell.swift
//  MyTranslate
//
//  Created by eun-ji on 2023/04/03.
//

import SnapKit
import UIKit

final class BookmarkCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookmarkCollectionViewCell"
    
    private var sourceBookmarkTextStackView : BookmarkTextStackView!
    private var targetBookmarkTextStackView : BookmarkTextStackView!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
       
        return stackView
    }()
    
    func setup(from boomark: Bookmark) {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        
        sourceBookmarkTextStackView = BookmarkTextStackView(language: boomark.sourceLanguage, text: boomark.sourceText, type: .source)
        targetBookmarkTextStackView = BookmarkTextStackView(language: boomark.translatedLaguage, text: boomark.traslatedText, type: .target)
        
        stackView.subviews.forEach{$0.removeFromSuperview()}
        
        [sourceBookmarkTextStackView, targetBookmarkTextStackView].forEach{
            stackView.addArrangedSubview($0)
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32)
        }
        layoutIfNeeded()
    }
}
