//
//  BookedCardView.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct BookedCardView: View {
    let bookedLaundry: BookedLaundry

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Laundry Image
            Image(bookedLaundry.laundry.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                // Name & Rating
                HStack {
                    Text(bookedLaundry.laundry.name)
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text("Booked")
                        .font(.caption)
                        .bold()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .foregroundColor(.green)
                        .background(.green.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }

                // Address
                Text(bookedLaundry.laundry.address)
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.8))
                    .bold()
                    .padding(.bottom, 4)

                // Description
                HStack {
                    Text("Service:")
                        .font(.caption)
                        .bold()
                        .frame(width: 50, alignment: .leading)
                    Text("\(bookedLaundry.service) Laundry")
                        .font(.caption)
                }
                
                HStack {
                    Text("Pickup:")
                        .font(.caption)
                        .bold()
                        .frame(width: 50, alignment: .leading)
                    Text("\(bookedLaundry.estimatedPickupTime.formatted(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                }
                
                HStack {
                    Text("Price:")
                        .font(.caption)
                        .bold()
                        .frame(width: 50, alignment: .leading)
                    Text("Rp\(bookedLaundry.totalPrice)/per Kg")
                        .font(.caption)
                }
            }
        }
        .padding(.all, 8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: .init(width: 8, height: 8)))
        
    }
}

#Preview {
    BookedCardView(bookedLaundry: .dummy)
}
