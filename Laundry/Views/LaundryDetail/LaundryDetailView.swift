//
//  LaundryDetailView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct LaundryDetailView: View {
        
    var body: some View {
        Text("Laundry Detail View")
            .navigationTitle("Detail View")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LaundryDetailView()
    }
}
