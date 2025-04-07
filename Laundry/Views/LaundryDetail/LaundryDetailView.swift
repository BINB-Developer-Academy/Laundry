//
//  LaundryDetailView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct LaundryDetailView: View {
    //
    let laundry: Laundry = .dummy
    //
    let ironingPrice: Int = 5_000
    @State var isIroningSelected = false
    //
    @State var selectedService: String = ""
    //
    @State var selectedDate = Date()
    @State var totalPrice: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                //MARK: - Laundry Image
                VStack {
                    Image("\(laundry.imageName)_large")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Text(laundry.description)
                        .font(.body)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading)
                        .padding(.top, 8)
                }
                
                //MARK: - Service Selection
                SectionHeader(title: "Select Service")
                    .padding(.top, 16)
                
                VStack(spacing: 0) {
                    ServiceOption(title: "Same Day", price: "Rp25.000/per Kg", selectedService: $selectedService)
                    ServiceOption(title: "Next Day", price: "Rp18.000/per Kg", selectedService: $selectedService)
                    ServiceOption(title: "Three Day", price: "Rp12.000/per Kg", selectedService: $selectedService)
                }
                
                //MARK: - Add-on Selection
                SectionHeader(title: "Add On")
                    .padding(.top, 16)
                Toggle(isOn: $isIroningSelected) {
                    Text("Ironing • + Rp\(ironingPrice)/per Kg")
                        .font(.body)
                }
                .frame(height: 60)
                .padding(.horizontal)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 1)
                .shadow(radius: 0.5)
                
                //MARK: - Pickup Time Selection
                SectionHeader(title: "Select Pickup Time")
                DatePicker("Pickup Time",
                           selection: $selectedDate,
                           displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 1)
                    .shadow(radius: 0.5)
                    .padding(.bottom, 16)
                
                //MARK: - Calculation for Approximate Price footer
                if false {
                    // We can add 2 text, read more at https://developer.apple.com/documentation/swiftui/text#Combining-text-views
                    Text("Price per Kg: ")
                        .font(.caption)
                        .foregroundStyle(.gray) +
                    Text("Rp\(totalPrice)")
                        .font(.caption)
                        .foregroundStyle(.black)
                        .bold()
                }
                
                //MARK: - Button to Book Laundry Pickup
                NavigationLink {
                    //TODO: - Navigate to Booking Complete View
                    BookingCompleteView()
                } label: {
                    Text("Book Laundry Pickup")
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 40)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.05))
        .navigationTitle(laundry.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LaundryDetailView()
    }
}
