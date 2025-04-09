//
//  BusinessCardView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 12/03/25.
//

import SwiftUI

struct BusinessCardView: View {
    var body: some View {
        HStack(spacing: 8) {
            // Laundry Image
            Image("bali_laundry")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                // Name & Rating
                HStack {
                    Text("Bali Laundry")
                        .font(.system(size: 16, weight: .bold))

                    Spacer()

                    RatingView()
                }
                
                Spacer().frame(height: 4)

                // Address
                Text("Jl. Kediri, Tuban")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 6)

                // Description
                Text("Reliable and affordable laundry service in Bali.")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Rating View Component
struct RatingView: View {
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.green)

            Text(String(format: "%.1f", 4.5))
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.green)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.green.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

// MARK: - Preview
struct BusinessCardView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCardView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
