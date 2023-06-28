//
//  DefaultProfile.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import Foundation
import SwiftUI

struct ModelProfile {
    var username: String
    var profileImage: ProfileImage
    var notifications = true
    var messageCounter = 0 // Counts how many messages were sent through the API
    
    
    static let `default` = ModelProfile(username: "Anthony", profileImage: ProfileImage(profileImage: Image("User")))
}
