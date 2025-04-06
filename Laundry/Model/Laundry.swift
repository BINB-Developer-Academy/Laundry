//
//  Laundry.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct Laundry: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let description: String
    let rating: Double
    let imageName: String
    
    static var dummy: Laundry {
        Laundry(
            name: "Laundry Genius",
            address: "Jl. Kubu Anyar, Kuta",
            description: "At Laundry Genius, we take the hassle out of laundry with expert care and cutting-edge cleaning solutions.",
            rating: 4.9,
            imageName: "laundry_genius"
        )
    }
}
