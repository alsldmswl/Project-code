//
//  MenuSuggestionSectionView.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

struct MenuSuggestionSectionView: View {
    @Binding var coffeeMenu: [CoffeeMenu]
    
    var body: some View {
        VStack{
            Text("\(User.shared.username)님을 위한 추천메뉴")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack{
                    ForEach(coffeeMenu) { menu in
                        MenuSuggestionItemView(coffeeMenu: menu)
                    }
                }
                .padding(16)
            }
        }
        
    }
}

struct MenuSuggestionItemView: View{
    let coffeeMenu: CoffeeMenu
    var body: some View{
        VStack{
            coffeeMenu.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
            Text(coffeeMenu.name)
                .font(.caption)
        }
    }
}

