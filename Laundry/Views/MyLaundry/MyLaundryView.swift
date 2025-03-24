//
//  MyLaundryView.swift
//  Laundry
//
//  Created by Javier Fransiscus on 13/03/25.
//

import SwiftUI

struct MyLaundryView: View {
    @Binding var myBookedLaundries : [BookedLaundry]
    
    var body: some View {
        NavigationStack {
            List(myBookedLaundries) { bookedLaundry in
                Section {
                    BookedCardView(bookedLaundry: bookedLaundry)
                }
                .listSectionSpacing(8)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationTitle("My Laundry")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MyLaundryView(myBookedLaundries: .constant([
        .dummy
    ]))
}
