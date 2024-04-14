//
//  CartView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    CartProductView(product: product)
                }
                
                HStack {
                    Spacer()
                    Text("Total: ")
                    Text("\(formatPrice(cartManager.total))")
                }
                .padding(.horizontal)
                
            } else {
                VStack {
                    Text("Your Cart is empty!")
                    Text("Have a look at out Meats!")
                }
            }
                
        }
        .navigationTitle("My Cart")
    }
    
    func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "Invalid Price"
    }
}

#Preview {
    CartView()
}
