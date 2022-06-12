//
//  HomeView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold, design: .default))
                Spacer()
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            ScrollView(.vertical) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0 ..< 5) { item in
                            SectionView()
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 60)
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image("Logo1")
                    .resizable()
                    .frame(width: 48, height: 48)
            }
            Text("18 Sections".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(Color("card1"))
        .cornerRadius(30)
        .shadow(
            color: Color("card1").opacity(0.3),
            radius: 20,
            x: 20, y: 20
        )
    }
}
