//
//  CharlottesButcherApp.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

@main
struct CharlottesButcherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currentTab: Tab.Home)
                .environmentObject(CartManager())
                .environmentObject(FavoritesManager())
//            ProfileView()
        }
    }
}
