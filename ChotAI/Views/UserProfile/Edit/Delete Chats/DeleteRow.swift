//
//  DeleteRow.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 27/06/2023.
//

import SwiftUI

struct DeleteRow: View {
    @EnvironmentObject var modelData: ModelData
    var modelName: String
    var image: Image
    
    @State private var confirmAlert: Bool = false
    
    var body: some View {
        HStack {
            ProfileImage(profileImage: image)
            Spacer()
            Text("\(modelName)")
                .bold()
            Spacer()
            
            Button {
                confirmAlert.toggle()
            } label: {
                Image(systemName: "trash")
            }.alert(isPresented: $confirmAlert) {
                Alert(title: Text("Delete conversation with \(modelName)?"), message: Text("Chats cannot be retrived"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .destructive(Text("Delete"), action: {
                    switch modelName {
                    case "Chot":
                        modelData.profile.chotChat = []
                        modelData.profile.chotDisplayChat = []
                        modelData.profile.chotMessageCounter = 0
                        modelData.profile.resetChat = true
                    case "Blackbeard":
                        modelData.profile.blackbeardChat = []
                        modelData.profile.blackbeardDisplayChat = []
                        modelData.profile.blackbeardMessageCounter = 0
                        modelData.profile.resetChat = true
                    case "Kawuso":
                        modelData.profile.ninjaChat = []
                        modelData.profile.ninjaDisplayChat = []
                        modelData.profile.ninjaMessageCounter = 0
                        modelData.profile.resetChat = true
                    case "Jerry":
                        modelData.profile.townCrierChat = []
                        modelData.profile.townCrierDisplayChat = []
                        modelData.profile.townCrierMessageCounter = 0
                        modelData.profile.resetChat = true
                    default:
                        print("Deletion Error")
                    }
                }))
            }
            .padding()
            
        }
    }
    
    struct DeleteRow_Previews: PreviewProvider {
        static var previews: some View {
            DeleteRow(modelName: "Chot", image: Image("Chot"))
                .environmentObject(ModelData())
        }
    }
}
