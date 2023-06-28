//
//  ChotChat.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import SwiftUI
import OpenAIKit

/*
TODO

Params to add:

temperature
new personalities
 
*/

struct AIChat: View {
    @EnvironmentObject var modelData: ModelData
    @State private var responseText: String?
    @State private var isCompleting: Bool = false
    @State var prompt: String
    
    @State var chat: [ChatMessage] = []
    @State var displayChat: [ModelMessage] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(displayChat, id: \.id) { message in
                                ViewMessage(message: message)
                            }
                        }
                    }
                }
                .padding()
                
                if(isCompleting) {
                    ViewMessage(message: ModelMessage(id: UUID(), sender: .chot, message: "...", timeSent: Date.now))
                }
                
                HStack {
                    TextField("Prompt", text: $prompt)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        Task {
                            if(chat.isEmpty) {
                                chat.append(ChatMessage(role: .system, content: modelData.profile.aiPersonality.description.1))
                            }
                            isCompleting = true
                            chat.append(ChatMessage(role: .user, content: prompt))
                            displayChat.append(ModelMessage(id: UUID(), sender: .user, message: prompt, timeSent: Date.now))
                            prompt = ""
                            
                            if(modelData.profile.aiPersonality == .chot) {
                                modelData.profile.chotMessageCounter += 1
                            } else if(modelData.profile.aiPersonality == .blackbeard) {
                                modelData.profile.blackbeardMessageCounter += 1
                            } else {
                                modelData.profile.townCrierMessageCounter += 1
                            }
                            
                            do {
                                let config = Configuration(organizationId: "", apiKey: ModelData().openAI_API ?? "")
                                let openAI = OpenAI(config)
                                let chatParams = ChatParameters(model: "gpt-3.5-turbo", messages: chat, user: modelData.profile.username)
                                let chatCompletion = try await openAI.generateChatCompletion(parameters: chatParams)
                                self.responseText = chatCompletion.choices[0].message.content
                                chat.append(ChatMessage(role: .assistant, content: responseText ?? ""))
                                isCompleting = false
                                displayChat.append(ModelMessage(id: UUID(), sender: .chot, message: responseText ?? "", timeSent: Date.now))
                            } catch {
                                print("Error -  \(error)")
                            }
                        }
                    }) {
                        Image(systemName: "arrow.forward.circle")
                    }
                    
                }
                .padding()
            }
            .navigationTitle(modelData.profile.aiPersonality.rawValue)
        }
    }
}

struct AIChat_Previews: PreviewProvider {
    static var previews: some View {
        AIChat(prompt: "")
            .environmentObject(ModelData())
    }
}
