//
//  UpdateCellView.swift
//  DoggyDogg (iOS)
//
//  Created by Максим Чикинов on 19.06.2022.
//

import SwiftUI

struct UpdateCellView: View {
    var update: Update
    
    var body: some View {
        HStack {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .cornerRadius(20)
                .padding(.trailing, 4)
            
            VStack(alignment: .leading, spacing: 8.0) {
                Text(update.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(update.text)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color.black.opacity(0.6))
                
                Text(update.date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

struct UpdateCellView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateCellView(update: UpdateStore().updates.first!)
            .previewLayout(.sizeThatFits)
            
    }
}
