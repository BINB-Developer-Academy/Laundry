//
//  SectionHeader.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title.uppercased())
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemGray2))
    }
}

#Preview {
    SectionHeader(title: "Section Header")
}
