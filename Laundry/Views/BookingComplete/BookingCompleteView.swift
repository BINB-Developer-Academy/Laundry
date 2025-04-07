//
//  BookingCompleteView.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct BookingCompleteView: View {
    let laundryName = "Laundry Name"
    let isIroning = true
    let service = "Same Day"
    let estimatedPickupTime = Date()
    let totalPrice = 30_000
    
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.green)
                        .padding()
                    
                    Text(laundryName)
                        .font(.title2)
                        .bold()
                    
                    if isIroning {
                        Text("\(service) Laundry")
                            .bold() +
                        Text(" with ")
                            .font(.callout) +
                        Text("ironing")
                            .bold() +
                        Text(" booked.")
                    }else {
                        Text("\(service) Laundry")
                            .bold() +
                        Text(" booked.")
                    }
                    
                    Text("Pickup ") +
                    Text("\(estimatedPickupTime.formatted(date: .long, time: .shortened))")
                        .bold()
                    
                    Text("On delivery you will be charged ")
                        .padding(.top)
                    Text("Rp\(totalPrice)/per Kg")
                        .bold()
                    
                }
                .font(.callout)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.5)
                
                Button {
                    // View Booking Button Action
                } label: {
                    Text("View Booking")
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 40)
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
        }
        .padding()
        .navigationTitle("Booking Complete")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.05))
        .onAppear {
            // Add myBookedLaundries with bookedLaundry
        }
    }
}

#Preview {
    NavigationStack {
        BookingCompleteView()
    }
}
