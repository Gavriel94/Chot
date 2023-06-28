//
//  ModelData.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var profile = ModelProfile.default
    let openAI_API = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]
}
