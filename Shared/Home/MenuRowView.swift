//
//  MenuRowView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct MenuRowView: View {
    var title: String
    var icon: String
    var iconColor: Color = Color.profileIcon
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: icon)
                .frame(width: 32, height: 32, alignment: .leading)
                .font(.system(size: 20, weight: .light, design: .default))
                .foregroundColor(iconColor)
                .imageScale(.large)
            Text(title)
                .frame(alignment: .leading)
                .font(.system(size: 20, weight: .bold, design: .default))
                .scaledToFill()
            Spacer()
        }
    }
}

struct MenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(title: "Account", icon: "gear")
            .previewLayout(.sizeThatFits)
    }
}
