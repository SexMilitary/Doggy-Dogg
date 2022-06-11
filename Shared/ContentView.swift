//
//  ContentView.swift
//  Shared
//
//  Created by Максим Чикинов on 09.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var show: Bool = false
    @State var scale: Bool = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            BackCardView()
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(10), axis: (x: 1.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: show)
                .animation(.easeInOut(duration: 0.5), value: viewState)
            
            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(10), axis: (x: 1.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)
                .animation(.easeInOut(duration: 0.3), value: viewState)

            CardView()
                .offset(x: viewState.width, y: viewState.height)
                .blendMode(.hardLight)
                .scaleEffect(scale ? 1.05 : 1)
                .animation(.easeInOut(duration: 0.3), value: scale)
                .animation(
                    .spring(response: 0.3,
                            dampingFraction: 0.6,
                            blendDuration: 0),
                    value: viewState
                )
            
                .onLongPressGesture(minimumDuration: 0.3, maximumDistance: 0) {
                    show.toggle()
                } onPressingChanged: { _ in
                    scale.toggle()
                }
            
                .gesture(
                    DragGesture().onChanged({ value in
                        viewState = value.translation
                        show = true
                    })
                    .onEnded({ value in
                        viewState = .zero
                        show = false
                    })
                )
            
            BottomCardView()
                .blur(radius: show ? 0 : 20)
                .animation(.easeInOut(duration: 0.7), value: show)
                .offset(x: 0, y: show ? 500 : 1000)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
        ContentView()
            .previewDevice("iPhone 8")
    }
}
