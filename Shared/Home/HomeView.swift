//
//  HomeView.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold, design: .default))
                Spacer()
                AvatarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            GeometryReader { bounds in
                ScrollView(.vertical) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(sectionData) { item in
                                GeometryReader { geometry in
                                    SectionView(section: item)
                                        .rotation3DEffect(
                                            Angle(
                                                degrees:
                                                    Double(geometry.frame(in: .global).minX - 20) / -getAngleMultiplier(bounds: bounds)
                                            ),
                                            axis: (x: 0, y: 10, z: 0)
                                        )
                                }
                                .frame(width: 275, height: 275)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 60)
                    }
                    Spacer()
                }
            }
        }
    }
    
    func getAngleMultiplier(bounds: GeometryProxy) -> Double {
        if bounds.size.width > 500 {
            return 80
        } else {
            return 20
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}
