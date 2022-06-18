//
//  MenuView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct MenuView: View {
    
    let width: CGFloat = 150
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 16) {
                Text("Meng - 28% complete")
                    .font(.caption)
                
                LoaderView(width: width)
                
                MenuRowView(title: "Account", icon: "gear")
                    .frame(width: width)
                MenuRowView(title: "Billing", icon: "creditcard")
                    .frame(width: width)
                MenuRowView(title: "Sing out", icon: "person.crop.circle")
                    .frame(width: width)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: Color.profileGradientColors),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(
                color: .black.opacity(0.2),
                radius: 20,
                x: 0, y: 20
            )
            .padding(.top, 30)
            .padding(.horizontal, 30)
            .padding(.bottom, 15)
            
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct LoaderView: View {
    let width: CGFloat
    
    var body: some View {
        Color.white
            .frame(width: 38, height: 6, alignment: .center)
            .cornerRadius(3)
            .frame(width: 120, height: 6, alignment: .leading)
            .background(.black.opacity(0.08))
            .cornerRadius(3)
            .frame(width: width, height: 24, alignment: .center)
            .background(.black.opacity(0.1))
            .cornerRadius(12)
    }
}
