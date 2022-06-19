//
//  CardView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 11.06.2022.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Color.black
            
            VStack(alignment: .center, spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Doggy Card")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text("You'll pay for that!")
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
                    .allowsHitTesting(false)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
            .frame(width: 340, height: 200)
    }
}
