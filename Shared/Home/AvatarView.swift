//
//  AvatarView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { showProfile.toggle() }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36, alignment: .center)
                .clipShape(Circle())
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(showProfile: .constant(false))
    }
}

