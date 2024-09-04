//
//  LoginView.swift
//  GeoSpot
//
//  Created by Aritra on 04/09/24.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    enum Field {
        case username
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
                
                // Username Field
                CustomTextField(placeholder: "username", text: $username, isFocused: focusedField == .username, icon: "person.fill")
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                    .focused($focusedField, equals: .username)
                
                // Password Field
                CustomSecureField(placeholder: "password", text: $password, isFocused: focusedField == .password, icon: "key.fill")
                    .padding(.horizontal, 30)
                    .padding(.bottom, 20)
                    .focused($focusedField, equals: .password)
                
                // Login Button
                Button(action: {
                    handleLogin(username: username, password: password)
                }) {
                    HStack {
                        Text("login")
                        Image(systemName: "arrow.right.circle")
                    }
                    .font(.custom("IBM Plex Mono Bold", size: 18))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .padding(.horizontal, 120)
                
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
                GlowCircleView()
                    .navigationBarBackButtonHidden(true)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func handleLogin(username: String, password: String) {
            // Handle login action
            if username == "Test" && password == "test" {
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
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 20)
                .padding(.leading, 10)
            
            TextField("", text: $text)
                .font(.custom("IBM Plex Mono", size: 18))
                .foregroundColor(.white)
                .padding(.vertical, 12)
        }
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
                .padding(.leading, 40)
                .opacity(text.isEmpty ? 1 : 0),
            alignment: .leading
        )
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    var isFocused: Bool
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .frame(width: 20)
                .padding(.leading, 10)
            
            SecureField("", text: $text)
                .font(.custom("IBM Plex Mono", size: 18))
                .foregroundColor(.white)
                .padding(.vertical, 12)
        }
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
                .padding(.leading, 40)
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
