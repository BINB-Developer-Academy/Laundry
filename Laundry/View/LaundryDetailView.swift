//
//  LaundryDetailView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct LaundryDetailView: View {
    let laundry: Laundry
    @State private var selectedService: String?
    @State private var isIroningSelected = false
    @State private var selectedDate = Date()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Laundry Image
                Image(laundry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                // Description
                Text(laundry.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                // Service Selection
                SectionHeader(title: "Select Service")
                VStack(spacing: 8) {
                    ServiceOption(title: "Same Day", price: "Rp25.000/per Kg", selectedService: $selectedService)
                    ServiceOption(title: "Next Day", price: "Rp18.000/per Kg", selectedService: $selectedService)
                    ServiceOption(title: "Three Day", price: "Rp12.000/per Kg", selectedService: $selectedService)
                }

                // Add-on Selection
                SectionHeader(title: "Add On")
                Toggle(isOn: $isIroningSelected) {
                    Text("Ironing • + Rp5.000/per Kg")
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)

                // Pickup Time Selection
                SectionHeader(title: "Select Pickup Time")
                DatePicker("Pickup Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle(laundry.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Subviews

struct SectionHeader: View {
    let title: String

    var body: some View {
        Text(title.uppercased())
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
}

struct ServiceOption: View {
    let title: String
    let price: String
    @Binding var selectedService: String?

    var body: some View {
        Button(action: {
            selectedService = title
        }) {
            HStack {
                Text("\(title) • \(price)")
                    .font(.body)
                    .foregroundColor(.primary)

                Spacer()

                if selectedService == title {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LaundryDetailView(laundry: Laundry(
            name: "Laundry Genius",
            address: "Jl. Kubu Anyar, Kuta",
            description: "At Laundry Genius, we take the hassle out of laundry with expert care and cutting-edge cleaning solutions.",
            rating: 4.9,
            imageName: "laundry_genius"
        ))
    }
}
