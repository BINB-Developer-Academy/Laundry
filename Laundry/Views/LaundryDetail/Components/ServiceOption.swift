//
//  ServiceOption.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct ServiceOption: View {
    let title: String
    let price: String
    @Binding var selectedService: String?

    var body: some View {
        Button(action: {
            selectedService = title
        }) {
            HStack {
                Text("\(title) • \(price)")
                    .font(.body)
                    .foregroundColor(.primary)

                Spacer()
                
                // Unwrap the conditional statement, learn more at https://developer.apple.com/documentation/swift/optional#Optional-Binding
                if selectedService == title {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .frame(height: 60)
        .padding(.horizontal, 1)
        .shadow(radius: 0.5)
    }
}

#Preview {
    let previewTitle = "Same Day"
    ServiceOption(title: previewTitle, price: "Rp25.000/per Kg", selectedService: .constant(previewTitle))
}
