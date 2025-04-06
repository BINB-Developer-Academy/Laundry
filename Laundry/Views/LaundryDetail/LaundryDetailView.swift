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
    // Optional Value, read more at https://developer.apple.com/documentation/swift/optional
    @State var selectedService: String?
    @State var isIroningSelected = false
    @State var selectedDate = Date()
    
    var services: [String: Int] = [
        "Same Day": 25_000,
        "Next Day": 18_000,
        "Three Day": 12_000
    ]
    let ironingPrice: Int = 5_000
    @State private var totalPrice: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                //MARK: - Laundry Image
                HeaderDetailView(laundry: laundry)
                
                //MARK: - Service Selection
                ServiceOptionView(selectedService: $selectedService)
                
                //MARK: - Add-on Selection
                AddOnView(isIroningSelected: $isIroningSelected, ironingPrice: ironingPrice)
                
                //MARK: - Pickup Time Selection
                PickupDateView(selectedDate: $selectedDate)
                
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
                    BookingCompleteView(
                        myBookedLaundries: $myBookedLaundries,
                        selectedTab: $selectedTab,
                        navigationPath: $navigationPath,
                        bookedLaundry: bookedLaundry
                    )
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
        // View Life Cycle, read more at https://developer.apple.com/documentation/swiftui/view-input-and-events#View-life-cycle
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
