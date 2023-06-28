//
//  ChotChat.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.


import SwiftUI
import OpenAIKit

struct AIChat: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var responseText: String?
    @State private var isCompleting: Bool = false
    @State var prompt: String = ""
    
    @State var chat: [ChatMessage] = []
    @State var displayChat: [ModelMessage] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    ScrollViewReader { scrollView in
                        LazyVStack {
                            ForEach(displayChat, id: \.id) { message in
                                ZStack {
                                    ViewMessage(message: message)
                                }.id(message)
                            }
                            if(isCompleting) {
                                LoadingMessage()
                            }
                        }.onChange(of: displayChat.last) { msg in
                            withAnimation {
                                scrollView.scrollTo(msg)
                            }
                        }
                    }
                }
                .padding()

                HStack {
                    TextField("Prompt", text: $prompt)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        Task {
                            if(chat.isEmpty) {
                                chat.append(ChatMessage(role: .system, content: modelData.profile.aiPersonality.description(for: modelData.profile).1))
                            }
                            
                            isCompleting = true
                            chat.append(ChatMessage(role: .user, content: prompt))
                            displayChat.append(ModelMessage(id: UUID(), sender: .user, message: prompt, timeSent: Date.now))
                            prompt = ""
                            
                            do {
                                let config = Configuration(organizationId: "", apiKey: ModelData().openAI_API ?? "")
                                let openAI = OpenAI(config)
                                let chatParams = ChatParameters(model: "gpt-3.5-turbo", messages: chat, temperature: modelData.profile.aiTemperature.details.1, user: modelData.profile.username)
                                let chatCompletion = try await openAI.generateChatCompletion(parameters: chatParams)
                                
                                self.responseText = chatCompletion.choices[0].message.content
                                chat.append(ChatMessage(role: .assistant, content: responseText ?? ""))
                                isCompleting = false
                                
                                if(modelData.profile.aiPersonality == .chot) {
                                    displayChat.append(ModelMessage(id: UUID(), sender: .chot, message: responseText ?? "", timeSent: Date.now))
                                    modelData.profile.chotMessageCounter += 1
                                    if(modelData.profile.saveChats) {
                                        modelData.profile.chotChat = chat
                                        modelData.profile.chotDisplayChat = displayChat
                                    }
                                } else if(modelData.profile.aiPersonality == .blackbeard) {
                                    displayChat.append(ModelMessage(id: UUID(), sender: .blackbeard, message: responseText ?? "", timeSent: Date.now))
                                    modelData.profile.blackbeardMessageCounter += 1
                                    
                                    if(modelData.profile.saveChats) {
                                        modelData.profile.blackbeardChat = chat
                                        modelData.profile.blackbeardDisplayChat = displayChat
                                    }
                                } else if(modelData.profile.aiPersonality == .ninja) {
                                    displayChat.append(ModelMessage(id: UUID(), sender: .ninja, message: responseText ?? "", timeSent: Date.now))
                                    modelData.profile.ninjaMessageCounter += 1
                                    if(modelData.profile.saveChats) {
                                        modelData.profile.ninjaChat = chat
                                        modelData.profile.ninjaDisplayChat = displayChat
                                    }
                                } else {
                                    displayChat.append(ModelMessage(id: UUID(), sender: .townCrier, message: responseText ?? "", timeSent: Date.now))
                                    modelData.profile.townCrierMessageCounter += 1
                                    if(modelData.profile.saveChats) {
                                        modelData.profile.townCrierChat = chat
                                        modelData.profile.townCrierDisplayChat = displayChat
                                    }
                                }
                            } catch {
                                isCompleting = false
                                displayChat.append(ModelMessage(id: UUID(), sender: .chot, message: error.localizedDescription, timeSent: Date.now))
                            }
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.purple)
                                .frame(width: 30, height: 30)
                                
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(modelData.profile.aiPersonality.rawValue)
            .onChange(of: modelData.profile.resetChat) { _ in
                displayChat.removeAll()
                chat.removeAll()
                modelData.profile.resetChat = false
            }
            .onChange(of: modelData.profile.aiPersonality) { _ in
                if(modelData.profile.saveChats) {
                    switch modelData.profile.aiPersonality.rawValue {
                    case "Chot":
                        chat = modelData.profile.chotChat
                        displayChat = modelData.profile.chotDisplayChat
                    case "Blackbeard":
                        chat = modelData.profile.blackbeardChat
                        displayChat = modelData.profile.blackbeardDisplayChat
                    case "Kawuso":
                        chat = modelData.profile.ninjaChat
                        displayChat = modelData.profile.ninjaDisplayChat
                    case "Jerry":
                        chat = modelData.profile.townCrierChat
                        displayChat = modelData.profile.townCrierDisplayChat
                    default:
                        print("Model Error")
                    }
                } else {
                    displayChat.removeAll()
                    chat.removeAll()                    
                }
            }
            .onChange(of: modelData.profile.username) { _ in
                chat.append(ChatMessage(role: .user, content: "My name has been changed to \(modelData.profile.username)."))
            }
        }
    }
}

struct AIChat_Previews: PreviewProvider {
    static var previews: some View {
        AIChat()
            .environmentObject(ModelData())
    }
}
