//
//  TitleView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 11.06.2022.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            Image("Background1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
        }
        .padding()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
            .previewInterfaceOrientation(.portrait)
            .previewLayout(.sizeThatFits)
    }
}
