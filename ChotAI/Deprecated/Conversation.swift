//
//  Conversation.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import SwiftUI
import OpenAIKit

struct Conversation: View {
    @State private var responseText: String?
    @State private var isCompleting: Bool = false
    
    // Could potentially add variables to hold different personalities for Chot by changing the first prompt in the conversation
    let chat: [ChatMessage] = [
        ChatMessage(role: .system, content: "You are my personal assistant, your name is Chot. Please speak in the third person at all times.")
    ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ForEach(chat) { message in
                    Text("\(message.role.rawValue.capitalized): \(message.content)")
                        .padding(.vertical, 10)
                }
            }
            .padding(20)
            
            if isCompleting {
                VStack {
                    if let responseText = self.responseText {
                        Text("Assistant: \(responseText)")
                    } else {
                        Text("Assistant: ...")
                    }
                }
                .padding()
            } else {
                VStack {
                    Button {
                        isCompleting = true
                        
                        Task {
                            do {
                                let config = Configuration(organizationId: "", apiKey: ModelData().openAI_API ?? ""
                                )
                                let openAI = OpenAI(config)
                                let chatParams = ChatParameters(model: "gpt-3.5-turbo", messages: chat)
                                let chatCompletion = try await openAI.generateChatCompletion(parameters: chatParams
                                )
                                self.responseText = chatCompletion.choices[0].message.content
                            } catch {
                                print("Error - \(error)")
                            }
                        }
                    } label: {
                        Text("Submit")
                    }
                }
            }
        }
        Spacer()
    }
}

struct Conversation_Previews: PreviewProvider {
    static var previews: some View {
        Conversation()
    }
}
