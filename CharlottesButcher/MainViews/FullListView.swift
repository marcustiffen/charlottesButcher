//
//  FullListView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct FullListView: View {
    @EnvironmentObject var cartManager: CartManager
    
    @State private var searchText = ""
    
    var products: [Product] = Bundle.main.decode("products.json")
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(filteredProducts, id: \.id) { product in
                        ProductCardView(product: product)
                    }
                    .padding(.bottom)
                }
                .padding(20)
            }
            .background(
                LinearGradient(colors: [Color("MainColor"), Color("BackupColor").opacity(0.3)], startPoint: .top, endPoint: .bottom)
            )
            .navigationTitle("All Products")
            .navigationBarTitleDisplayMode(.automatic)
            .foregroundStyle(.white)
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    FullListView()
}
