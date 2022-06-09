//
//  ContentView.swift
//  Shared
//
//  Created by Максим Чикинов on 09.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: 300, height: 220)
            .background(.blue)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x: 0, y: -10)
            
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Doggy Card")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text("Pay it, beach!")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.accentColor)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Image("Logo1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40, alignment: .center)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 110, alignment: .top)
                    .padding(.horizontal, 20)
            }
            .frame(width: 340, height: 200)
            .background(.black)
            .cornerRadius(20)
            .shadow(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
