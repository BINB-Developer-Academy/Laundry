//
//  MyLaundryView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct MyLaundryView: View {
    let laundries: [Laundry] = [
        Laundry(
            name: "Laundry Genius",
            address: "Jl. Kubu Anyar, Kuta",
            description: "Smart laundry solutions in Bali, combining speed, precision, and quality for spotless results.",
            rating: 4.9,
            imageName: "laundry_genius"
        )
    ]
    
    var body: some View {
        NavigationStack {
            List(laundries) { laundry in
                Section {
                    BusinessCardView(laundry: laundry)
                }
                .listSectionSpacing(8)
                .listRowInsets(.init(top: 12, leading: 12, bottom: 12, trailing: 12))
            }
            .navigationTitle("My Laundry")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MyLaundryView()
}
