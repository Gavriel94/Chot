//
//  UserProfile.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import SwiftUI

struct UserProfile: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            VStack(alignment: .center) {
                
                HStack {
                    Text(modelData.profile.username)
                        .bold()
                        .font(.title)
                        .padding()
                    Spacer()
                }
                modelData.profile.profileImage
                    .padding()
                
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
                            .padding()
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
            }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
            .environmentObject(ModelData())
    }
}
