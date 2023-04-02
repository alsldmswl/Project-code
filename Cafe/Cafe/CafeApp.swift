//
//  CafeApp.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

@main
struct CafeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .accentColor(.green)
        }
    }
}
