//
//  ProfileEditor.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import SwiftUI
import PhotosUI

struct ProfileEditor: View {
    @Binding var profile: ModelProfile
    @State var imageSelection: PhotosPickerItem?
    @State private var showDelete = false
    
    @State private var usernameChange: Bool = false
    @State private var username: String = ""
    @State private var notEnoughChars: Bool = false
    
    var body: some View {
        VStack {
            List {
                Text(profile.username)
                    .font(.title)
                HStack {
                    Spacer()
                    profile.profileImage
                        .frame(alignment: .center)
                        .overlay(alignment: .bottomTrailing) {
                            PhotosPicker(
                                selection: $imageSelection,
                                matching: .images,
                                photoLibrary: .shared()) {
                                    Image(systemName: "pencil.circle.fill")
                                        .symbolRenderingMode(.multicolor)
                                        .font(.system(size: 30))
                                        .foregroundColor(.accentColor)
                                }
                                .buttonStyle(.borderless)
                                .onChange(of: imageSelection) { _ in
                                    Task {
                                        if let data = try? await imageSelection?.loadTransferable(type: Data.self) {
                                            if let uiImage = UIImage(data: data) {
                                                profile.profileImage = ProfileImage(profileImage: Image(uiImage: uiImage))
                                                return
                                            }
                                        }
                                    }
                                }
                        }
                    
                    Spacer()
                    
                }
                
                HStack {
                    Text("Change Username")
                        .bold()
                    Spacer()
                    Button {
                        usernameChange.toggle()
                    } label: {
                        Image(systemName: "pencil.circle")
                            .imageScale(.large)
                    }.alert("Change Username", isPresented: $usernameChange) {
                        TextField("Username", text: $username)
                        Button("Save", action: {
                            validateUsername()
                            
                        })
                        Button("Cancel", role: .cancel) { }
                    }
                }
                
                
                
                HStack {

                    Toggle("Save Chats", isOn: $profile.saveChats)
                        .bold()
                }
                
                VStack {
                    
                    HStack {
                        Picker("AI Personality", selection: $profile.aiPersonality) {
                            ForEach(ModelProfile.Personality.allCases) { personality in
                                Text(personality.rawValue).tag(personality)
                            }
                        }
                        .pickerStyle(.menu)
                        .bold()
                    }
                    
                    Divider()
                    
                    VStack {
                        Text(profile.aiPersonality.description(for: profile).2)
                        ProfileImage(profileImage: profile.aiPersonality.description(for: profile).0)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        Picker("AI Creativity", selection: $profile.aiTemperature) {
                            ForEach(ModelProfile.Creativity.allCases) { creativity in
                                Text(creativity.details.0).tag(creativity)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .navigationTitle("Edit")
                    
                    Divider()
                    
                    Button {
                        showDelete.toggle()
                    } label: {
                        Text("Delete Chats")
                            .foregroundColor(.red)
                    }
                }
            }
            .sheet(isPresented: $showDelete) {
                DeleteHost()
            }
        }
    }
    
    func validateUsername() {
        if(username.count > 3) {
            profile.username = username
        }
    }
    
    struct ProfileEditor_Previews: PreviewProvider {
        static var previews: some View {
            ProfileEditor(profile: .constant(.default))
        }
    }
}
