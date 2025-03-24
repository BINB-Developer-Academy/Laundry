//
//  HeaderDetailView.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct HeaderDetailView: View {
    let laundry: Laundry
    
    var body: some View {
        HStack (alignment: .top) {
            Image(laundry.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Text(laundry.description)
                .font(.body)
                .padding(.top, 8)
        }
    }
}

#Preview {
    HeaderDetailView(laundry: .dummy)
}
