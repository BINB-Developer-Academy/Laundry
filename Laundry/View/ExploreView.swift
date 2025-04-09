//
//  ExploreView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    BusinessCardView()
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
