//
//  Product.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int
    let name: String
    let image: String
    let description: String
    let price: Double
}
