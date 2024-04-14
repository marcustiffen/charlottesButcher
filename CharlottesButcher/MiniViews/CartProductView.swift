//
//  CartProductView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 01/02/2024.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Image(product.image)
                    .resizable()
                    .frame(width: 100, height: 90)
                    .cornerRadius(20)
                    .position(CGPoint(x: 70.0, y: geometry.size.height / 2))
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title3)
                    
                    Text("\(formatPrice(product.price))")
                        .font(.footnote)
                        .bold()
                }
                .position(CGPoint(x: 60.0, y: geometry.size.height / 2))
                    
                    
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.red)
                    .position(CGPoint(x: 84.0, y: geometry.size.height / 2))
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
        }
        .background(
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 375, height: 105)
                    .foregroundStyle(.black)
                
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 370, height: 100)
                    .foregroundStyle(.white)
            }
        )
        .padding(.vertical, 50)
    }
    
    func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: price)) ?? "Invalid Price"
    }
}

//#Preview {
//    CartProductView(product: Product(id: 1, name: "T-bone Steak", image: "t-bonesteak", description: "T-bone steak is a cut from the short loin, featuring a T-shaped bone with tenderloin on one side and strip steak on the other.", price: 12.85))
//}

