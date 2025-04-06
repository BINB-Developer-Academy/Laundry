//
//  PickupDateView.swift
//  Laundry
//
//  Created by Handy Handy on 04/04/25.
//

import SwiftUI

struct PickupDateView: View {
    @Binding var selectedDate: Date
    var body: some View {
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
    }
}

#Preview {
    PickupDateView(selectedDate: .constant(Date()))
}
