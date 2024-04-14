//
//  CartManager.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    
    @Published private(set) var total: Double = 0.0
    
    func addToCart(product: Product) {
        products.append(product)
        total += Double(product.price)
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= Double(product.price)
    }
}
