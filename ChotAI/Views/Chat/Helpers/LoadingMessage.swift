//
//  LoadingMessage.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 23/06/2023.
//

import SwiftUI

struct LoadingMessage: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .padding()
            .background(.green)
            .cornerRadius(24)
    }
    
    struct LoadingMessage_Previews: PreviewProvider {
        static var previews: some View {
            LoadingMessage()
        }
    }
}
