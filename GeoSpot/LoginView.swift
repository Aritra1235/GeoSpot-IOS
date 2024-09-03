//
//  LoginView.swift
//  GeoSpot
//
//  Created by Aritra on 04/09/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            // Logo or App Name
            Text("GeoSpot")
                .font(.custom("IBM Plex Mono Bold", size: 34)) // Use the PostScript name
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Spacer()
            
            // Email Field
            TextField("Email", text: $email)
                .font(.custom("IBM Plex Mono", size: 18)) // Regular font weight
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            // Password Field
            SecureField("Password", text: $password)
                .font(.custom("IBM Plex Mono", size: 18)) // Regular font weight
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            // Login Button
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .font(.custom("IBM Plex Mono Bold", size: 18)) // Use the bold font
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            // Sign Up Link
            HStack {
                Text("Don't have an account?")
                    .font(.custom("IBM Plex Mono", size: 16)) // Regular font weight
                    .foregroundColor(.white)
                Button(action: {
                    // Handle sign up action
                }) {
                    Text("Sign Up")
                        .font(.custom("IBM Plex Mono Bold", size: 16)) // Use the bold font
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
