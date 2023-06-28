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
    
    @State private var nameWritten: Bool = false
    
    var body: some View {
    
        NavigationStack {
            ProfileImage(profileImage: Image("Chot"))
            
            Text("What should Chot call you?")
                .font(.title)
                .padding()
            Spacer()
            HStack {
                TextField("Your name", text: $modelData.profile.username)
                    .textFieldStyle(.roundedBorder)
                Divider()
                Text("\(modelData.profile.username.count)/3")
                    .font(.subheadline)
            }
            .frame(height: 0.3)
            Spacer()
            
            Button {
                nameWritten = true
            } label: {
                Image(systemName: "checkmark.circle")
                    .imageScale(.large)
            }
            .padding()
            .disabled(modelData.profile.username.count < 3)
            .navigationTitle("ChotAI")
            .navigationDestination(isPresented: $nameWritten) {
              AppHome()
            }
        }
        .padding()
    }
    
    struct CreateProfile_Previews: PreviewProvider {
        static var previews: some View {
            CreateProfile()
                .environmentObject(ModelData())
        }
    }
}
