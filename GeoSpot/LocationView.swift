//
//  LocationView.swift
//  GeoSpot
//
//  Created by Aritra on 04/09/24.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Latitude: \(location.coordinate.latitude)")
                    .font(.custom("IBM Plex Mono", size: 18))
                    .foregroundColor(.white)
                Text("Longitude: \(location.coordinate.longitude)")
                    .font(.custom("IBM Plex Mono", size: 18))
                    .foregroundColor(.white)
            } else {
                Text("Fetching location...")
                    .font(.custom("IBM Plex Mono", size: 18))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .navigationBarTitle("Your Location", displayMode: .inline)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

