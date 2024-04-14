//
//  ProductView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 02/02/2024.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 365, height: 200)
                            .foregroundStyle(Color("BackupColor").opacity(0.8))
                        
                        HStack(spacing: 100) {
                            Image(product.image)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                            
                            VStack {
                                Text("\(formatPrice(product.price))")
                                    .foregroundStyle(.black.opacity(0.8))
                                    .font(.headline)
                                    .bold()
                                    .padding(.top, 1)
                                
                                Button {
                                    cartManager.addToCart(product: product)
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .foregroundStyle(.green)
                                        .frame(width: 30, height: 30)
                                }
                                .padding(.bottom)
                            }
                        }
                    }
                    
                    Text("More Info about \(product.name):")
                        .bold()
                        .font(.subheadline)
                    
                    Text(product.description)
                        .multilineTextAlignment(.leading)
                        .font(.callout)
                        .padding()
                }
            }
            .navigationTitle(product.name)
        }
    }
    
    func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "Invalid Price"
    }
}

//#Preview {
//    ProductView(product: Product(id: 1, name: "T-bone Steak", image: "t-bonesteak", description: "T-bone steak is a cut from the short loin, featuring a T-shaped bone with tenderloin on one side and strip steak on the other.", price: 12.85))
//}
