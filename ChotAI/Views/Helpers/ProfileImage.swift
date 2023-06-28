//
//  ProfileImage.swift
//  ChotAI
//
//  Created by Anthony Gavriel on 20/06/2023.
//

import SwiftUI

struct ProfileImage: View {
    var profileImage: Image
    var body: some View {
        profileImage
            .resizable()
            .clipShape(Circle())
            .frame(width: 150, height: 150)
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
                    .shadow(radius: 4)
            }
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(profileImage: Image("User"))
    }
}
