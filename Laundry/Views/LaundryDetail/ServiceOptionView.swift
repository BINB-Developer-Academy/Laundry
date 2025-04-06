//
//  ServiceOptionView.swift
//  Laundry
//
//  Created by Handy Handy on 04/04/25.
//

import SwiftUI

struct ServiceOptionView: View {
    @Binding var selectedService: String?
    
    var body: some View {
        SectionHeader(title: "Select Service")
            .padding(.top, 16)
        
        VStack(spacing: 0) {
            ServiceOption(title: "Same Day", price: "Rp25.000/per Kg", selectedService: $selectedService)
            ServiceOption(title: "Next Day", price: "Rp18.000/per Kg", selectedService: $selectedService)
            ServiceOption(title: "Three Day", price: "Rp12.000/per Kg", selectedService: $selectedService)
        }
    }
}

#Preview {
    ServiceOptionView(selectedService: .constant(""))
}
