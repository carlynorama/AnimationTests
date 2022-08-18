//
//  SlidingDoorsView.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
// see also: https://nerdyak.tech/development/2020/07/17/creating-onboarding-screens-in-swiftui.html

import SwiftUI


struct SlidingDoorsView: View {
    @State var showText = false
    
    var body: some View {
        VStack {
            if (showText) {
                Text("HELLO WORLD")
                    .padding()
                    .background(Color.secondary)
                    .transition(
                        AnyTransition.modifier(
                            active: SlidingDoorEffect(shift: 300),
                            identity: SlidingDoorEffect(shift: 0)
                        )
                    )
            }
            Button(action: {
                withAnimation() {
                    showText.toggle()
                }
            }) {
                Text("Change me")
            }
        }.border(.blue)
    }
}

struct HalfClipShape: Shape {
    var left: Bool
        
    func path(in rect: CGRect) -> Path {
        // shape covers lef or right part of rect
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            let startx:CGFloat = left ? 0 : width/2
            let shapeWidth:CGFloat = width/2
            
            path.move(to: CGPoint(x: startx, y: 0))
            
            path.addLines([
                CGPoint(x: startx+shapeWidth, y: 0),
                CGPoint(x: startx+shapeWidth, y: height),
                CGPoint(x: startx, y: height),
                CGPoint(x: startx, y: 0)
            ])
        }
    }
}

struct SlidingDoorEffect: ViewModifier {
    let shift: CGFloat
    
    func body(content: Content) -> some View {
        let c = content
        return ZStack {
            c.clipShape(HalfClipShape(left: false)).offset(x: -shift, y: 0)
            c.clipShape(HalfClipShape(left: true)).offset(x: shift, y: 0)
        }
    }
}

struct SlidingDoorsView_Previews: PreviewProvider {
    static var previews: some View {
        SlidingDoorsView()
    }
}
