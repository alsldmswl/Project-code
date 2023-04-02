//
//  SearchBarViewModel.swift
//  SearchBlog
//
//  Created by eun-ji on 2023/04/01.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    let queryText = PublishRelay<String?>()
    let shouldLoadResult: Observable<String>
    let searchButtonTapped = PublishRelay<Void>()
    
    init() {
        self.shouldLoadResult = searchButtonTapped
            .withLatestFrom(queryText) { $1 ?? "" }
            .filter{ !$0.isEmpty }
            .distinctUntilChanged()
    }
}
