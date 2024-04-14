//
//  FeaturedMeatsView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 29/01/2024.
//

import SwiftUI

struct FeaturedMeatsView: View {
    @State private var currentIndex = 0
    
    @GestureState private var translation: CGFloat = 0
    
    var products: [Product] = Bundle.main.decode("products.json")
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(products.indices, id: \.self) { index in
                    NavigationLink(destination: ProductView(product: products[index])) {
                        Image(products[index].image)
                            .resizable()
                            .frame(width: 180, height: 180)
                            .scaledToFit()
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }
                }
            }
            .gesture(
                DragGesture()
                    .updating($translation) { value, state, _ in
                        state = value.translation.width
                    }
                    .onEnded { value in
                        let offset = value.translation.width
                        let newIndex = currentIndex + (offset > 0 ? -1 : 1)
                        currentIndex = min(max(newIndex, 0), products.count - 1)
                    }
            )
        }
        .animation(.interactiveSpring, value: 2)
    }
}

#Preview {
    FeaturedMeatsView()
}
