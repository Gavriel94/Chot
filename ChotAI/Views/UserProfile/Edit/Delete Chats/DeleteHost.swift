//
//  DeleteHost.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 27/06/2023.
//

import SwiftUI

struct DeleteHost: View {
    @EnvironmentObject var modelData: ModelData
    @State var confirmAlert: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(ModelProfile.Personality.allCases, id: \.id) { personality in
                    DeleteRow(modelName: personality.rawValue, image: Image("\(personality.rawValue)"))
                }
            }
            Button {
                confirmAlert.toggle()
            } label: {
                Text("Delete All")
                    .foregroundColor(.red)
            }.alert(isPresented: $confirmAlert) {
                Alert(title: Text("Delete all conversations?"), message: Text("Chats cannot be retrived"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .destructive(Text("Delete"), action: {
                    modelData.profile.chotChat = []
                    modelData.profile.chotDisplayChat = []
                    modelData.profile.chotMessageCounter = 0
                
                    modelData.profile.blackbeardChat = []
                    modelData.profile.blackbeardDisplayChat = []
                    modelData.profile.blackbeardMessageCounter = 0
                    
                    modelData.profile.ninjaChat = []
                    modelData.profile.ninjaDisplayChat = []
                    modelData.profile.ninjaMessageCounter = 0
                    
                    modelData.profile.townCrierChat = []
                    modelData.profile.townCrierDisplayChat = []
                    modelData.profile.townCrierMessageCounter = 0
                    
                    modelData.profile.resetChat = true
                }))
            }
        }
    }
}

struct DeleteHost_Previews: PreviewProvider {
    static var previews: some View {
        DeleteHost()
            .environmentObject(ModelData())
    }
}
