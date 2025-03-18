//
//  LaundryApp.swift
//  Laundry
//
//  Created by Javier Fransiscus on 12/03/25.
//

import SwiftUI

@main
struct LaundryApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ExploreView()
                    .tabItem {
                        Label("Explore", systemImage: "map")
                    }
                
                MyLaundryView()
                    .tabItem {
                        Label("My Laundry", systemImage: "washer")
                    }
            }
        }
    }
}
