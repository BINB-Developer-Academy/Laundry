//
//  RatingView.swift
//  Laundry
//
//  Created by Handy Handy on 23/03/25.
//
import SwiftUI

struct RatingView: View {
    let rating: Double
    var colorRating: Color {
        if rating <= 4 {
            return .red
        } else {
            return .green
        }
    }
    
    var body: some View {
        HStack (spacing: 4) {
            Image(systemName: "star.fill")
            Text(rating.description)
        }
        .font(.caption)
        .bold()
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .foregroundColor(colorRating)
        .background(colorRating.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Laundry(
            name: "Bali Laundry",
            address: "Jl. Kediri, Tuban",
            description: "Reliable and affordable laundry service in Bali.",
            rating: 3.6,
            imageName: "bali_laundry"
        ).rating)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
