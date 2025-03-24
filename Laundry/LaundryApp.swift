//
//  LaundryApp.swift
//  Laundry
//
//  Created by Javier Fransiscus on 12/03/25.
//

import SwiftUI

@main
struct LaundryApp: App {
    
    @State var myBookedLaundries: [BookedLaundry] = []
    @State var selectedTab: Int = 0
    
    var body: some Scene {
        WindowGroup {
            TabView (selection: $selectedTab) {
                ExploreView(myBookedLaundries: $myBookedLaundries, selectedTab: $selectedTab)
                    .tabItem {
                        Label("Explore", systemImage: "map")
                    }
                    .tag(0)
                MyLaundryView(myBookedLaundries: $myBookedLaundries)
                    .tabItem {
                        Label("My Laundry", systemImage: "washer")
                    }
                    .tag(1)
            }
        }
    }
}
