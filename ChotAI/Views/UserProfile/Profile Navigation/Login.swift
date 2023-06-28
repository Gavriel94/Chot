//
//  Login.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 27/06/2023.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var modelData: ModelData
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var signUp: Bool = false
    @State private var signIn: Bool = false
    
    @State private var usernameIncorrect: Bool = false
    @State private var passwordIncorrect: Bool = false
    
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
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .overlay { usernameIncorrect ?
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 2)
                            :
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 0)
                        }
                        
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .overlay { passwordIncorrect ?
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 2)
                            :
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 0)
                        }
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Button {
                        if(username.lowercased() == modelData.profile.username.lowercased() && password == modelData.profile.password) {
                            signIn.toggle()
                        }
                        else {
                            if(username == modelData.profile.username) {
                                usernameIncorrect = false
                            } else {
                                usernameIncorrect = true
                            }
                            if(password == modelData.profile.password) {
                                passwordIncorrect = false
                            } else {
                                passwordIncorrect = true
                            }
                        }
                    } label: {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    }
                    .padding()
                    .navigationDestination(isPresented: $signIn) {
                                  AppHome()
                    }
                    
                    Text("Haven't got an account?")
                        .padding(.top)
                    
                    Button {
                        signUp.toggle()
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.clear)
                            .cornerRadius(15.0)
                    }
                    .navigationDestination(isPresented: $signUp) {
                                  CreateProfile()
                    }
                }
                
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [.purple, .white]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(ModelData())
    }
}
