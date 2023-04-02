//
//  HomeView.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical){
            HomeHeaderView()
            MenuSuggestionSectionView()
            Spacer(minLength: 32)
            EventSectionView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
