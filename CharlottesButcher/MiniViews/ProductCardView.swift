//
//  ProductCardView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var product: Product = Bundle.main.decode("products.json")

    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .frame(width: 180, height: 265)
                .foregroundStyle(Color("BackupColor").opacity(0.8))
            
            VStack {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 150, height: 150)
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    
                    Text(product.name)
                        .font(.title).bold()
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 10) {
                        Text("\(formatPrice(product.price))")
                            .font(.title2)
                            .foregroundStyle(.white.opacity(0.75))
                            .padding(.bottom)
                            .padding(.horizontal)
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName:"plus.circle.fill")
                                .resizable()
                                .foregroundStyle(.green)
                                .frame(width: 25, height: 25)
                        }
                        .padding(.bottom)
                        
                        Button {
                            if favoritesManager.isFavorite == false {
                                favoritesManager.addToFavorite(product: product)
                            } else {
                                favoritesManager.removeFromFavorite(product: product)
                            }
                        } label: {
                            Image(systemName: "heart")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 25, height: 25)
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
    }
    
    func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "Invalid Price"
    }
}

#Preview {
    ProductCardView()
}
