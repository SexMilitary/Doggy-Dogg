//
//  UpdateDetailView.swift
//  DoggyDogg (iOS)
//
//  Created by Максим Чикинов on 18.06.2022.
//

import SwiftUI

struct UpdateDetailView: View {
    var update: Update
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .navigationBarTitle(update.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UpdateDetailView(update: UpdateStore().updates[1])            
        }
    }
}
