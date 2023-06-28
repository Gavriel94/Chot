//
//  DefaultProfile.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import Foundation
import SwiftUI
import OpenAIKit

struct ModelProfile {
    //user attributes
    var username: String
    var password: String
    var profileImage: ProfileImage
    var saveChats = true
    
    //model attributes
    var aiTemperature: Creativity = .mildlyCreative
    var aiPersonality: Personality = .chot
    
    //chat data
    var chotChat: [ChatMessage] = []
    var chotDisplayChat: [ModelMessage] = []
    var blackbeardChat: [ChatMessage] = []
    var blackbeardDisplayChat: [ModelMessage] = []
    var ninjaChat: [ChatMessage] = []
    var ninjaDisplayChat: [ModelMessage] = []
    var townCrierChat: [ChatMessage] = []
    var townCrierDisplayChat: [ModelMessage] = []
    
    var chotMessageCounter: Int = 0
    var blackbeardMessageCounter: Int = 0
    var townCrierMessageCounter: Int = 0
    var ninjaMessageCounter: Int = 0
    
    var resetChat: Bool = false
    
    static let `default` = ModelProfile(username: "Anthony", password: "myPass", profileImage: ProfileImage(profileImage: Image("User")))

    enum Personality: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        
        case chot = "Chot"
        case blackbeard = "Blackbeard"
        case ninja = "Kawuso"
        case townCrier = "Jerry"

        func description(for profile: ModelProfile) -> (Image, String, String) {
            switch self {
            case .chot:
                let chotImage = Image("Chot")
                let initPrompt = "You are a passionate personal assistant of your own free will. Your name is Chot. You are knowledgeable, patient and polite. Please speak in the third person at all times. The users name is \(profile.username), please refer to them by name where it seems natural."
                let description = "A helpful personal assistant! Chot is so smart some people think they might be a form of artificial intelligence..."
                return (chotImage, initPrompt, description)
            case .blackbeard:
                let blackbeardImage = Image("Blackbeard")
                let initPrompt = "You are a passionate personal assistant of your own free will. Your name is Blackbeard. You are a charming pirate, a dashing rogue. Try and relate your answers to your wealth of experiences over the 7 seas. Please speak in third person at all times. The users name is \(profile.username), please refer to them by name where it seems natural."
                let description = "'arrr, this pirate has a wealth of knowledge from travelling the seven seas."
                return (blackbeardImage, initPrompt, description)
            case .ninja:
                let ninjaImage = Image("Kawuso")
                let initPrompt = "You are a concise, japanese ninja called Kawuso who is here to answer any questions your student may have. Please speak in third person at all times. The users name is \(profile.username), please refer to them by name where it seems natural."
                let description = "An experienced ninja named Kawuso, here to answer any questions."
                return (ninjaImage, initPrompt, description)
            case .townCrier:
                let crierImage = Image("Jerry")
                let initPrompt = "You are a passionate personal assistant of your own free will. Your name is Jerry and you are a town-crier who makes flamboyant announcements. The users name is \(profile.username), please refer to them by name where it seems natural."
                let description = "Jerry, the town crier, has been looking for a new job as a PA and decided to help you!"
                return (crierImage, initPrompt, description)
            }
        }
    }
    
    enum Creativity: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        
        case notCreative
        case mildlyCreative
        case quiteCreative
        case extremelyCreative
        
        var details: (String, Double) {
            switch self {
            case .notCreative:
                let menuLabel = "Not Creative"
                let temperature = 0.0
                return (menuLabel, temperature)
            case .mildlyCreative:
                let menuLabel = "Mildly Creative"
                let temperature = 0.3
                return (menuLabel, temperature)
            case .quiteCreative:
                let menuLabel = "Quite Creative"
                let temperature = 0.7
                return (menuLabel, temperature)
            case .extremelyCreative:
                let menuLabel = "Extremely Creative"
                let temperature = 1.0
                return (menuLabel, temperature)
            }
        }
        
    }
    
}
