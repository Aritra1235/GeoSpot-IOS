//
//  MainNavigationView.swift
//  GeoSpot
//
//  Created by Aritra on 04/09/24.
//

import SwiftUI

struct MainNavigationView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GlowCircleView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            OffsiteView()
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Offsite")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
        }
        .accentColor(.white)
    }
}



struct OffsiteView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Offsite View")
                .foregroundColor(.white)
        }
    }
}

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Settings View")
                .foregroundColor(.white)
        }
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
