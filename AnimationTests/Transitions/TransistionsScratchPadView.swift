//
//  ContentView.swift
//  AnimationTests
//
//  Created by Carlyn Maw on 8/17/22.
// https://stackoverflow.com/questions/59390201/swiftui-transitions-scale-from-some-frame-like-ios-homescreen-is-doing-when-o

import SwiftUI

struct TransistionsScratchPadView: View {
    @State var showStuff:Bool = false
    
    var body: some View {
        VStack {
            Button("showStuff") {
                withAnimation {
                showStuff.toggle()
                }
            }
            Spacer()
            Text("View")
            .overlay {
                if showStuff {
//                    RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.blue)
//                    .frame(width: 100, height: 100)
//                    .transition(.move(edge: .trailing).combined(with: .move(edge: .top)))
                    //func scale(x: CGFloat, y: CGFloat, anchor: UnitPoint) -> ScaledShape<Self>

                    Circle()
                        
                        //works
                        //.transition(AnyTransition.scale(scale: 0, anchor: UnitPoint.topLeading))
                        //.transition(.move(edge: .top))
                        //.transition(.slide)
                    //.transition(.scale(scale: 2))
                        //.transition(AnyTransition.scale(scale: 2, anchor: UnitPoint(x: 1, y: 0)))
                       // .transition(.move(edge: .trailing).combined(with: .move(edge: .top)))
//                    UnitPoint(x: 1, y: 0) -- transitions towards top right
//                    UnitPoint(x: -1, y: 0) -- transitions towards top left
//                    UnitPoint(x: 0, y: 1) -- transitions towards bottom left
//                    UnitPoint(x: 0, y: -1) -- transitions towards bottom right
//                        .transition(.slide.combined(with: .scale))
//
                        .border(.blue)
                }
            }
        }.animation(.linear(duration: 5), value: showStuff)
    }
}



struct TransistionsScratchPadView_Previews: PreviewProvider {
    static var previews: some View {
        TransistionsScratchPadView()
    }
}
