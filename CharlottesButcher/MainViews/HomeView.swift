//
//  HomeView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink(destination: CartView()
                    .environmentObject(cartManager)) {
                    CartButtonView(numberOfProducts: cartManager.products.count)
                }
                
                Text("Browse some of our selected Meats:")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWidth(.expanded)
                    .multilineTextAlignment(.leading)
                    

                FeaturedMeatsView()
                    .padding(.top)
                
                Text("Our opening times are:")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWidth(.compressed)
                    .multilineTextAlignment(.leading)

            }
            .background(
                LinearGradient(colors: [Color("MainColor"), Color("BackupColor").opacity(0.3)], startPoint: .top, endPoint: .bottom)
            )
            .navigationTitle("Butcher")
        }
    }
}


#Preview {
    HomeView()
}
