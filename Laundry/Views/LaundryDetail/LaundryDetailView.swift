//
//  LaundryDetailView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct LaundryDetailView: View {
    @Binding var myBookedLaundries: [BookedLaundry]
    @Binding var selectedTab: Int
    @Binding var navigationPath: [String]
    
    let laundry: Laundry
    @State private var selectedService: String?
    @State private var isIroningSelected = false
    @State private var selectedDate = Date()
    
    var services: [String: Int] = ["Same Day": 25_000, "Next Day": 18_000, "Three Day": 12_000]
    let ironingPrice: Int = 5_000
    @State private var totalPrice: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                //MARK: - Laundry Image
                HeaderDetailView(laundry: laundry)
                
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
                DatePicker("Pickup Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 1)
                    .shadow(radius: 0.5)
                    .padding(.bottom, 16)
                
                
                //MARK: - Calculation for Approximate Price footer
                // Unwrap the conditional statement, learn more at https://developer.apple.com/documentation/swift/optional#Optional-Binding
                if selectedService != nil {
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
                    let bookedLaundry = BookedLaundry(
                        laundry: laundry,
                        service: selectedService ?? "",
                        servicePrice: services[selectedService ?? ""] ?? 0,
                        totalPrice: totalPrice,
                        isIroning: isIroningSelected,
                        estimatedPickupTime: selectedDate
                    )
                    BookingCompleteView(myBookedLaundries: $myBookedLaundries, selectedTab: $selectedTab, navigationPath: $navigationPath, bookedLaundry: bookedLaundry)
                } label: {
                    Text("Book Laundry Pickup")
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 40)
                }
                .buttonStyle(.borderedProminent)
                .disabled(selectedService == nil)
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.05))
        .navigationTitle(laundry.name)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: selectedService) { oldValue, newValue in
            updatePrice()
        }
        .onChange(of: isIroningSelected) { oldValue, newValue in
            updatePrice()
        }
    }
    
    func updatePrice() {
        if let selectedService = selectedService {
            // Ternary operator, learn more at https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Ternary-Conditional-Operator
            totalPrice = isIroningSelected ? services[selectedService]! + ironingPrice : services[selectedService]!
        }
    }
}



// MARK: - Preview
#Preview {
    NavigationStack {
        LaundryDetailView(
            myBookedLaundries: .constant([]), selectedTab: .constant(0), navigationPath: .constant([]),
            laundry: Laundry(
                name: "Laundry Genius",
                address: "Jl. Kubu Anyar, Kuta",
                description: "At Laundry Genius, we take the hassle out of laundry with expert care and cutting-edge cleaning solutions.",
                rating: 4.9,
                imageName: "laundry_genius"
            ))
    }
}
