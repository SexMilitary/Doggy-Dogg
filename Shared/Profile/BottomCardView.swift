//
//  BottomCardView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 11.06.2022.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        ZStack {
            Color.white
            
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
        }
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.1), radius: 30, x: 0, y: -10)
    }
}

struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
