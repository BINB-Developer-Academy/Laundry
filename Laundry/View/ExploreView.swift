//
//  ExploreView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct ExploreView: View {
    var laundries: [Laundry] = [
        Laundry(
            imageName: "bali_laundry",
            title: "Bali Laundry",
            address: "Jl. Kediri",
            description: "Reliable Laundry",
            rating: 4.5),
        Laundry(
            imageName: "blue_star",
            title: "Blue Star",
            address: "Milky Way Galaxy",
            description: "The best laundry in the galaxy",
            rating: 3.0),
        Laundry(
            imageName: "buff",
            title: "Buff",
            address: "Milky Way Galaxy",
            description: "The best laundry in the galaxy",
            rating: 3.0)
    ]
    
    var body: some View {
        NavigationStack {
            // do a similar thing to loopinp / loop
            List(laundries) { laundry in
                Section {
                    BusinessCardView(laundry: laundry)
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
