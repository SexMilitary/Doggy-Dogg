//
//  BackCardView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 11.06.2022.
//

import SwiftUI

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 200)
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView()
            .previewInterfaceOrientation(.portrait)
            .previewLayout(.sizeThatFits)
    }
}
