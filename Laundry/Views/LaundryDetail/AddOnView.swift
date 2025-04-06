//
//  AddOnView.swift
//  Laundry
//
//  Created by Handy Handy on 04/04/25.
//

import SwiftUI

struct AddOnView: View {
    @Binding var isIroningSelected: Bool
    var ironingPrice: Int = 0
    var body: some View {
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
    }
}

#Preview {
    AddOnView(isIroningSelected: .constant(false))
}
