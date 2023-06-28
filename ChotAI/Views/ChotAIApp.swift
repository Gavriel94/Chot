//
//  ChotAIApp.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import SwiftUI

@main
struct ChotAIApp: App {
    @StateObject private var modelData = ModelData() // Ensures variable is initialised only once during app life time
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
