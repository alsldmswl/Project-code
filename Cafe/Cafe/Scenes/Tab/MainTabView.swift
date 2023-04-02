//
//  MainTabView.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Tab.home.imageItem
                    Tab.home.TextItem
                }
            Text("Other")
                .tabItem{
                    Tab.other.imageItem
                    Tab.other.TextItem
                }
        
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

