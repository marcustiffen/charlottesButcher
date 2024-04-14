//
//  FavoritesManager.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 05/02/2024.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published private(set) var favoriteProducts: [Product] = []
    
    @Published private(set) var isFavorite: Bool = false
    
    func addToFavorite(product: Product) {
        isFavorite = true
        favoriteProducts.append(product)
    }
    
    func removeFromFavorite(product: Product) {
        isFavorite = true
        favoriteProducts = favoriteProducts.filter { $0.id != product.id }
    }
}
