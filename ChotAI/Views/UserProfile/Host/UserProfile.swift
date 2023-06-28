//
//  UserProfile.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import SwiftUI

struct UserProfile: View {
    @EnvironmentObject var modelData: ModelData
    @State private var logout: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                
                HStack {
                    Text(modelData.profile.username)
                        .bold()
                        .font(.title)
                        .padding()
                    Spacer()
                }
                modelData.profile.profileImage
                
                
                Divider()
                
                HStack {
                    if(modelData.profile.aiPersonality == .chot) {
                        Text("Messages sent to Chot: \(modelData.profile.chotMessageCounter)")
                    } else if(modelData.profile.aiPersonality == .blackbeard) {
                        Text("Messages sent to Blackbeard: \(modelData.profile.blackbeardMessageCounter)")
                    } else if(modelData.profile.aiPersonality == .ninja) {
                        Text("Messages sent to Kawuso: \(modelData.profile.ninjaMessageCounter)")
                    } else {
                        Text("Messages sent to Jerry: \(modelData.profile.townCrierMessageCounter)")
                    }
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    HStack {
                        Text(modelData.profile.aiPersonality.rawValue)
                            .bold()
                            .font(.title)
                            .padding(.leading)
                        Spacer()
                    }
                    
                    ProfileImage(profileImage: modelData.profile.aiPersonality.description(for: modelData.profile).0)
                    
                    Text(modelData.profile.aiPersonality.description(for: modelData.profile).2)
                        .padding()
                }
                
                HStack {
                    Text("Creativity: \(modelData.profile.aiTemperature.details.0)")
                }
                
                Spacer()
                
                Button {
                    logout = true
                } label: {
                    Text("Log Out")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.red)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $logout) {
                    Login()
                }
                
                Spacer()
            }
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
            .environmentObject(ModelData())
    }
}
