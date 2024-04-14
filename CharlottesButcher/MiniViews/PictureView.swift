//
//  PictureView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 04/02/2024.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct PictureView: View {
    @State private var processedImage: Image?
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $selectedItem) {
            if let processedImage = processedImage {
                processedImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                ContentUnavailableView("No Profile Photo", systemImage: "person.circle")
            }
        }
        .buttonStyle(.borderless)
        .onChange(of: selectedItem) { newItem in
            loadImage(item: newItem)
        }
    }
    
    func loadImage(item: PhotosPickerItem?) {
        Task {
            do {
                guard let imageData = try await item?.loadTransferable(type: Data.self) else {
                    return
                }
                
                if let uiImage = UIImage(data: imageData) {
                    processedImage = Image(uiImage: uiImage)
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }
}

#Preview {
    PictureView()
}
