//
//  BookingCompleteView.swift
//  Laundry
//
//  Created by Handy Handy on 24/03/25.
//

import SwiftUI

struct BookingCompleteView: View {
    @Binding var myBookedLaundries: [BookedLaundry]
    @Binding var selectedTab: Int
    @Binding var navigationPath: [String]
    
    let bookedLaundry: BookedLaundry
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.green)
                        .padding()
                    
                    Text(bookedLaundry.laundry.name)
                        .font(.title2)
                        .bold()
                    
                    if bookedLaundry.isIroning {
                        Text("\(bookedLaundry.service) Laundry")
                            .bold() +
                        Text(" with ")
                            .font(.callout) +
                        Text("ironing")
                            .bold() +
                        Text(" booked.")
                    }else {
                        Text("\(bookedLaundry.service) Laundry")
                            .bold() +
                        Text(" booked.")
                    }
                    
                    Text("Pickup ") +
                    Text("\(bookedLaundry.estimatedPickupTime.formatted(date: .long, time: .shortened))")
                        .bold()
                    
                    Text("On delivery you will be charged ")
                        .padding(.top)
                    Text("Rp\(bookedLaundry.totalPrice)/per Kg")
                        .bold()
                    
                }
                .font(.callout)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 0.5)
                
                Button {
                    navigationPath.removeAll()
                    selectedTab = 1
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
        .navigationBarBackButtonHidden()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.05))
        .onAppear {
            myBookedLaundries.append(bookedLaundry)
        }
    }
}

#Preview {
    NavigationStack {
        BookingCompleteView(myBookedLaundries: .constant([]), selectedTab: .constant(0), navigationPath: .constant([]), bookedLaundry: .dummy)
    }
}
