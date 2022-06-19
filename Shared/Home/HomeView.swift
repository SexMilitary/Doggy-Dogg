//
//  HomeView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold, design: .default))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { showUpdate.toggle() }) {
                        ZStack {
                            Color.white
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                            
                            Image(systemName: "bell")
                                .renderingMode(.template)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 16, weight: .light))
                                .frame(width: 36, height: 36)
                                
                        }
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateListView()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                GeometryReader { bounds in
                    ScrollView(.vertical) {
                        СarouselView()
                        Spacer()
                    }
                }
            }
        }
    }
}

struct СarouselView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(sectionData) { item in
                    GeometryReader { geometry in
                        SectionView(section: item).rotation3DEffect(
                            Angle(degrees: Double(-geometry.frame(in: .global).minX) / 20),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .padding(.bottom, 60)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
