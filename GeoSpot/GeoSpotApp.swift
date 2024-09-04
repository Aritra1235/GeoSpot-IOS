//
//  GeoSpotApp.swift
//  GeoSpot
//
//  Created by Aritra on 01/09/24.
//

import SwiftUI

@main
struct GeoSpotApp: App {
    @State private var isLoggedIn = false
        
        var body: some Scene {
            WindowGroup {
                if isLoggedIn {
                    MainNavigationView()
                } else {
                    LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}
