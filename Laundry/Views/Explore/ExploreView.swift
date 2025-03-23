//
//  ExploreView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct ExploreView: View {
    let laundries: [Laundry] = [
        Laundry(
            name: "Bali Laundry",
            address: "Jl. Kediri, Tuban",
            description: "Reliable and affordable laundry service in Bali, offering fast washes with quality care for your clothes.",
            rating: 4.7,
            imageName: "bali_laundry"
        ),
        Laundry(
            name: "Blue Star Wash",
            address: "Jl. Drupadi, Kuta",
            description: "Premium laundry in Bali with eco-friendly washing and expert garment care for a fresh, clean feel.",
            rating: 4.3,
            imageName: "blue_star"
        ),
        Laundry(
            name: "Laundry Genius",
            address: "Jl. Kubu Anyar, Kuta",
            description: "Smart laundry solutions in Bali, combining speed, precision, and quality for spotless results.",
            rating: 4.9,
            imageName: "laundry_genius"
        ),
        Laundry(
            name: "Buff",
            address: "Jl. Pantai, Kuta",
            description: "High-end Bali laundry specializing in delicate fabrics, luxury care, and top-tier cleanliness.",
            rating: 3.9,
            imageName: "buff"
        ),
        Laundry(
            name: "The Clean Cure",
            address: "Jl. Raya, Seminyak",
            description: "A fresh take on laundry in Bali, using eco-conscious methods for a cleaner, greener wash.",
            rating: 4.8,
            imageName: "clean_cure"
        ),
        Laundry(
            name: "The Soap Co.",
            address: "Jl. Kubu Anyar, Kuta",
            description: "Stylish and sustainable laundry service in Bali, where quality cleaning meets modern care.",
            rating: 4.4,
            imageName: "soap_co"
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(laundries) { laundry in
                Section {
                    BusinessCardView(laundry: laundry).overlay {
                        NavigationLink(destination: LaundryDetailView(laundry: laundry)) {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                }
                .listSectionSpacing(8)
                .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
            }
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
