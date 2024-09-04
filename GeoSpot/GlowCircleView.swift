//
//  GlowCircleView.swift
//  GeoSpot
//
//  Created by Aritra on 04/09/24.
//

import SwiftUI

struct GlowCircleView: View {
    var body: some View {
        ZStack {
            // Background color
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Title
                Text("GeoSpot")
                    .font(.custom("IBM Plex Mono Bold", size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 60)
                
                // Glowing circle
                Circle()
                    .fill(Color.purple.opacity(0.8))
                    .frame(width: 170, height: 170)
                    .shadow(color: Color.purple.opacity(10), radius: 80, x: 0, y: 0)
                
                // Welcome text
                Text("welcome, Aritra")
                    .font(.custom("IBM Plex Mono Bold", size: 18))
                    .fontWeight(.bold)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.bottom, 180)
                    .frame(maxWidth: .infinity, alignment: .leading) // Aligns text to the left
                    .padding(.leading, 30) // Optional: Adjust the padding from the left edge
                
            }
        }
    }
}

struct GlowCircleView_Previews: PreviewProvider {
    static var previews: some View {
        GlowCircleView()
    }
}
