//
//  Update.swift
//  DoggyDogg (iOS)
//
//  Created by Максим Чикинов on 15.06.2022.
//

import Foundation

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}
