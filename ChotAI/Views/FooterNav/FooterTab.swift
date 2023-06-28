////
////  FooterTab.swift
////  ChotApp
////
////  Created by Anthony Gavriel on 21/06/2023.
////

import SwiftUI

struct FooterTab: View {
    var body: some View {
        TabView {
            AIChat(prompt: "")
                .tabItem {
                    Image(systemName: "bubble.left")
                }
            ProfileHost()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct FooterTab_Previews: PreviewProvider {
    static var previews: some View {
        FooterTab()
            .environmentObject(ModelData())
    }
}
