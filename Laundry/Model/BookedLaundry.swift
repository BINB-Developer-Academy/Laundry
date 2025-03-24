//
//  BookedLaundry.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import Foundation

struct BookedLaundry: Identifiable {
    let id = UUID()
    let laundry: Laundry
    let service: String
    let servicePrice: Int
    let totalPrice: Int
    let isIroning: Bool
    let estimatedPickupTime: Date
    
    static var dummy: BookedLaundry {
        BookedLaundry(
            laundry: Laundry.dummy,
            service: "Next Day",
            servicePrice: 1_000,
            totalPrice: 5_000,
            isIroning: true,
            estimatedPickupTime: Date()
        )
    }
}
