//
//  ModelMessage.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import Foundation

struct ModelMessage: Hashable {
    var id: UUID
    var sender: MessageSender
    var message: String
    var timeSent: Date
}

enum MessageSender: String {
    case user
    case chot
    case blackbeard
    case ninja
    case townCrier
    
    func senderAsString() -> String {
        switch self {
        case .user:
            return "user"
        case .chot:
            return "chot"
        case .blackbeard:
            return "blackbeard"
        case .ninja:
            return "ninja"
        case .townCrier:
            return "townCrier"
        }
    }
}
