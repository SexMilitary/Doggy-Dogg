//
//  Home.swift
//  DoggyDogg
//
//  Created by Максим Чикинов on 12.06.2022.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.profileBackground
                .edgesIgnoringSafeArea(.all)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 10,
                        style: .continuous
                    )
                )
            
            HomeView(showProfile: $showProfile)
                .padding(.top, 44)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .offset(y: showProfile ? -250 : 0)
                .scaleEffect(showProfile ? 0.9 : 1)
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 20,
                    x: 0, y: 50
                )
                .rotation3DEffect(
                    Angle(degrees: showProfile ? (viewState.height / 60 - CGFloat(10)) : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .animation(.spring(), value: showProfile)
                .animation(.spring(), value: viewState)
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0), value: showProfile)
                .animation(.spring(), value: viewState)
                .rotation3DEffect(Angle(degrees: showProfile ? -10 : 0),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
                .onTapGesture {
                    showProfile.toggle()
                }
            
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            viewState = value.translation
                            if viewState.height < -200 {
                                viewState.height = -200
                            }
                        })
                        .onEnded({ _ in
                            if viewState.height > 50 {
                                showProfile = false
                            }
                            viewState = .zero
                        })
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
