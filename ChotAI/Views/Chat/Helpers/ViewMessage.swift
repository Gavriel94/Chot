//
//  UserMessage.swift
//  ChotApp
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import SwiftUI
import OpenAIKit

struct ViewMessage: View {
    var message: ModelMessage
    
    var body: some View {
        HStack {
            if(message.sender == .user) {
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text(message.message)
                        .padding(.bottom)
                    
                    Text(message.timeSent.formatted(date: .numeric, time: .shortened))
                        .font(.footnote)
                }
                .foregroundColor(.white)
                .padding()
                .background(.purple)
                .cornerRadius(24)
            }
            if(message.sender == .chot) {
                VStack(alignment: .leading) {
                    
                    Text(message.message)
                        .padding(.bottom)
                    
                    Text(message.timeSent.formatted(date: .numeric, time: .shortened))
                        .font(.footnote)
                }
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(24)
                
                    Spacer()
                }
                
            }
        }
    }

struct ViewMessage_Previews: PreviewProvider {
    static var previews: some View {
        let userModelTest = ModelMessage(id: UUID(), sender: .user, message: "User message!", timeSent: Date.now)
        let chotModelTest = ModelMessage(id: UUID(), sender: .chot, message: "Chot message!", timeSent: Date.now)
        ViewMessage(message: userModelTest)
        ViewMessage(message: chotModelTest)
    }
}
