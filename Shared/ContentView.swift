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
    @State var showCard: Bool = false
    @State var botomViewState = CGSize.zero
    @State var showFull: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.2)
                        .speed(1.4),
                    value: showCard
                )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 200)
                .background(show ? Color("card3") : Color("card4"))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: showCard ? 10 : 20,
                        style: .continuous
                    )
                )
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .scaleEffect(showCard ? 1.0 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
                .animation(.easeInOut(duration: 0.5), value: show)
                .animation(.easeInOut(duration: 0.5), value: showCard)
                .animation(.easeInOut(duration: 0.5), value: viewState)
                .blendMode(.hardLight)
            
            BackCardView()
                .frame(width: 340, height: 200)
                .background(show ? Color("card4") : Color("card3"))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: showCard ? 10 : 20,
                        style: .continuous
                    )
                )
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -50 : 0)
                .scaleEffect(showCard ? 1.0 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5),
                                  axis: (x: 1.0, y: 0.0, z: 0.0))
                .animation(.easeInOut(duration: 0.3), value: show)
                .animation(.easeInOut(duration: 0.3), value: showCard)
                .animation(.easeInOut(duration: 0.3), value: viewState)
                .blendMode(.hardLight)
            
            CardView()
                .frame(width: showCard ? 365 : 340, height: 200)
                .shadow(radius: 20)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: showCard ? 10 : 20,
                        style: .continuous
                    )
                )
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
            
                .onTapGesture {
                    showCard.toggle()
                    scale.toggle()
                }
            
                .gesture(
                    DragGesture().onChanged({ value in
                        viewState = value.translation
                        if !showCard {
                            show = true
                        }
                    })
                    .onEnded({ value in
                        viewState = .zero
                        show = false
                    })
                )
            
            BottomCardView()
                .offset(y: showCard ? 500 : 1000)
                .offset(y: botomViewState.height)
            
                .blur(radius: showCard ? 0 : 20)
            
                .animation(.timingCurve(0.3, 0.8, 0.2, 1, duration: 0.8),
                           value: showCard)
                .animation(.default, value: botomViewState)
            
                .gesture(
                    DragGesture().onChanged({ value in
                        botomViewState = value.translation
                        if showFull {
                            botomViewState.height += -300
                            guard botomViewState.height > -350 else {
                                botomViewState.height = -350
                                return
                            }
                        }
                    })
                    .onEnded({ value in
                        if botomViewState.height > 50 {
                            showCard = false
                        }
                        if botomViewState.height < -300 {
                            botomViewState.height = -300
                        }
                        if (botomViewState.height < -100 && !showFull) ||
                            (botomViewState.height < -250 && showFull) {
                            botomViewState.height = -300
                            showFull = true
                        } else {
                            botomViewState.height = .zero
                            showFull = false
                        }
                    })
                )
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
