//
//  BusinessCardView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 12/03/25.
//

import SwiftUI

struct BusinessCardView: View {
    let laundry: Laundry

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Laundry Image
            Image(laundry.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                // Name & Rating
                HStack {
                    Text(laundry.name)
                        .font(.headline)
                        .bold()
                    Spacer()
                    RatingView(rating: laundry.rating)
                }

                // Address
                Text(laundry.address)
                    .font(.caption)
                    .bold()
                    .padding(.bottom, 4)

                // Description
                Text(laundry.description)
                    .font(.caption)
            }
        }
    }
}

// MARK: - Preview
struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView(laundry: .init(
            name: "Bali Laundry",
            address: "Jl. Kediri, Tuban",
            description: "Reliable and affordable laundry service in Bali, offering fast washes with quality care for your clothes.",
            rating: 4.7,
            imageName: "bali_laundry"
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
