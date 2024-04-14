//
//  CartButtonView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfProducts: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .font(.system(size: 30))
                .foregroundStyle(.black)
                .padding(5)
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .frame(width: 25, height: 25)
                    .font(.title)
                    .foregroundStyle(.black)
                    .background(Circle().fill(Color.green))
            }
        }
    }
}

#Preview {
    CartButtonView(numberOfProducts: 2)
}
