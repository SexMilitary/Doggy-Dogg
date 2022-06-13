//
//  SectionView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 13.06.2022.
//

import SwiftUI

struct SectionView: View {
    var section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
                    .resizable()
                    .frame(width: 48, height: 48)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(
            color: section.color.opacity(0.3),
            radius: 20,
            x: 20, y: 20
        )
    }
}
