//
//  BottomCardView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 11.06.2022.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This sertificate is proof that Meng to has achieved the UI Design cource eith approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
            .previewInterfaceOrientation(.portrait)
            .previewLayout(.sizeThatFits)
    }
}
