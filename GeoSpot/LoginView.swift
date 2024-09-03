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
    @State private var isLoggedIn = false
    @FocusState private var focusedField: Field?
    
    enum Field {
        case email
        case password
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Logo or App Name
                Text("GeoSpot")
                    .font(.custom("IBM Plex Mono Bold", size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Spacer()
                
                // Email Field
                CustomTextField(placeholder: "username", text: $email, isFocused: focusedField == .email)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .focused($focusedField, equals: .email)
                
                // Password Field
                CustomSecureField(placeholder: "password", text: $password, isFocused: focusedField == .password)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .focused($focusedField, equals: .password)
                
                // Login Button
                Button(action: {
                    handleLogin(email: email, password: password)
                }) {
                    Text("login")
                    .font(.custom("IBM Plex Mono Bold", size: 18))
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
                    Text("Facing Problems?")
                        .font(.custom("IBM Plex Mono", size: 16))
                        .foregroundColor(.white)
                    Button(action: {
                        handleContactUs()
                    }) {
                        Text("Contact Us")
                            .font(.custom("IBM Plex Mono Bold", size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .padding(.bottom, 20)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $isLoggedIn) {
                LocationView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func handleLogin(email: String, password: String) {
        // Handle login action
        if email == "test@test.com" && password == "test" {
            print("Login tapped")
            isLoggedIn = true
        }
    }

    private func handleContactUs() {
        // Handle contact us action
        if let url = URL(string: "mailto:support@example.com") {
            UIApplication.shared.open(url)
        }
    }
}


struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isFocused: Bool
    
    var body: some View {
        TextField("", text: $text)
            .font(.custom("IBM Plex Mono", size: 18))
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .background(Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isFocused ? Color.white : Color.gray, lineWidth: 2)
            )
            .overlay(
                Text(placeholder)
                    .font(.custom("IBM Plex Mono", size: 18))
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10)
                    .opacity(text.isEmpty ? 1 : 0),
                alignment: .leading
            )
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    var isFocused: Bool
    
    var body: some View {
        SecureField("", text: $text)
            .font(.custom("IBM Plex Mono", size: 18))
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .background(Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isFocused ? Color.white : Color.gray, lineWidth: 2)
            )
            .overlay(
                Text(placeholder)
                    .font(.custom("IBM Plex Mono", size: 18))
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10)
                    .opacity(text.isEmpty ? 1 : 0),
                alignment: .leading
            )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
