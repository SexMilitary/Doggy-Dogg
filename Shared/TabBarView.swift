//
//  TabBarView.swift
//  DoggyDogg (iOS)
//
//  Created by Максим Чикинов on 19.06.2022.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.secondarySystemBackground
    }
    
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "a")
                Text("Home")
            }
            ProfileView().tabItem {
                Image(systemName: "a")
                Text("Sertificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
