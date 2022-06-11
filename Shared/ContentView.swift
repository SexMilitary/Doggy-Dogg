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
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(.degrees(10), axis: (x: 1.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5), value: show)
            
            BackCardView()
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(10), axis: (x: 1.0, y: 0.0, z: 0.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3), value: show)

            CardView()
                .blendMode(.hardLight)
                .scaleEffect(scale ? 1.05 : 1)
                .animation(.easeInOut(duration: 0.3), value: scale)
                .onLongPressGesture(minimumDuration: 1, maximumDistance: 1) {
                    self.show.toggle()
                } onPressingChanged: { _ in
                    self.scale.toggle()
                }
            
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
