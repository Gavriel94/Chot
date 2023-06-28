//
//  ContentView.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 21/06/2023.
//

import SwiftUI

struct AppHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        TabView {
            AIChat()
                .tabItem {
                    Image(systemName: "bubble.left")
                }
            ProfileHost()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .navigationBarBackButtonHidden(true)
        .tint(.green)
    }
}

struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
            .environmentObject(ModelData())
    }
}
