//
//  ContentView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: Tab.Home.rawValue)
                }
            
            FullListView()
                .tabItem {
                    Label("Full List", systemImage: Tab.FullList.rawValue)
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: Tab.Favorites.rawValue)
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: Tab.Profile.rawValue)
                }
        }
    }
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case FullList = "list.bullet.circle"
    case Favorites = "heart"
    case Profile = "person.circle"
}


//#Preview {
//    ContentView()
//}
