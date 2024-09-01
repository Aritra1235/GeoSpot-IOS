//
//  ContentView.swift
//  GeoSpot
//
//  Created by Aritra on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
                    .padding()
            } else {
                Text("Fetching location...")
                    .padding()
            }
        }
        .onAppear {
            // This ensures the location updates when the view appears
            locationManager.objectWillChange.sink { _ in
                // Optional: Handle any additional logic when the location changes
            }
        }
    }
}

