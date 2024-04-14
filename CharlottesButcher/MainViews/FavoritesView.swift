//
//  FavoritesView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var products: [Product] = Bundle.main.decode("products.json")
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(favoritesManager.favoriteProducts, id: \.id) { product in
                        ProductCardView(product: product)
                    }
                    .padding(.bottom)
                }
                .padding(20)
            }
            
            .background(
                LinearGradient(colors: [Color("MainColor"), Color("BackupColor").opacity(0.3)], startPoint: .top, endPoint: .bottom)
            )
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.automatic)
            .foregroundStyle(.white)
        }
    }
}

//#Preview {
//    FavoritesView()
//}
