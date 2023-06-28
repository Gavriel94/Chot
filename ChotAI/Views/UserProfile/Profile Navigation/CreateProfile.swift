//
//  CreateProfile.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 27/06/2023.
//

import SwiftUI
import PhotosUI

struct CreateProfile: View {
    @EnvironmentObject var modelData: ModelData
    @State var imageSelection: PhotosPickerItem?
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordCheck: String = ""
    @State private var showPassword: Bool = false
    
    @State private var signIn: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Chot")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .shadow(radius: 0.9)
                
                
                ProfileImage(profileImage: Image("Chot"))
                
                Spacer()
                
                VStack {
                    TextField("Your name for Chot", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                    Group {
                        if(showPassword) {
                            TextField("Create Password", text: $password)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(10)
                            TextField("Confirm Password", text: $passwordCheck)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(10)
                        } else {
                            SecureField("Create Password", text: $password)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(10)
                            SecureField("Confirm Password", text: $passwordCheck)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(10)
                        }
                    }
                    Button {
                        showPassword.toggle()
                    } label: {
                        Text(showPassword ? "Hide Password" : "Show Password")
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
                .padding()
                
                Spacer()
                
                Button {
                    modelData.profile.username = username
                    modelData.profile.password = password
                    signIn = true
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.green)
                        .cornerRadius(15.0)
                }
                .disabled(password != passwordCheck || username.count < 3 || password.count < 3)
                .navigationDestination(isPresented: $signIn) {
                              AppHome()
                }
                
                Spacer()
                
            }
            .background(LinearGradient(gradient: Gradient(colors: [.purple, .white]), startPoint: .top, endPoint: .bottom))
            
            .edgesIgnoringSafeArea(.all)
        }
        .tint(.white)
    }
    
    struct CreateProfile_Previews: PreviewProvider {
        static var previews: some View {
            CreateProfile()
                .environmentObject(ModelData())
        }
    }
}
