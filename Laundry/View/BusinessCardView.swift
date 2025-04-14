//
//  BusinessCardView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 12/03/25.
//

import SwiftUI

// 1. Make a Laundry object (properties, functions) ✅
// 2. Utilize a Laundry array to generate a list of laundry ✅
// 3. Utilize the List SwiftUI components to render the list of laundry ✅

struct Laundry: Identifiable {
    var id: UUID = UUID()
    
    // Properties
    // image
    var imageName: String
    // title
    var title: String
    // address
    var address: String
    // description
    var description: String
    // rating
    var rating: Float
    
    // Functions (optional)
    // no func
}

struct BusinessCardView: View {
    var laundry: Laundry
    
    var body: some View {
        HStack(spacing: 8) {
            // Laundry Image
            Image(laundry.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                // Name & Rating
                HStack {
                    Text(laundry.title)
                        .font(.system(size: 16, weight: .bold))

                    Spacer()

                    RatingView(rating: laundry.rating)
                }
                
                Spacer().frame(height: 4)

                // Address
                Text(laundry.address)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 6)

                // Description
                Text(laundry.description)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Rating View Component
struct RatingView: View {
    var rating: Float
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(.green)

            Text(String(format: "%.1f", rating))
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
        // dummy data
        BusinessCardView(laundry: Laundry(
            imageName: "bali_laundry",
            title: "title",
            address: "address",
            description: "description",
            rating: 2.0))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
