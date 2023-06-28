//
//  ProfileHost.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = ModelProfile.default
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        VStack {
            
            HStack {
                if editMode == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode = .inactive
                    }
                }
                
                Spacer()
                
                Button(action: { editMode = (editMode == .inactive) ? .active : .inactive }) {
                    Text(editMode == .inactive ? "Edit" : "Done")
                }
            }
            
            if editMode == .inactive {
                UserProfile()
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .onChange(of: editMode, perform: { newValue in
            if newValue == .inactive {
                modelData.profile = draftProfile
            }
        })
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
