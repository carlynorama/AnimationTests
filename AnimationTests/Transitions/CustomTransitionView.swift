//
//  CustomTransitionView.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
//

import SwiftUI

struct CustomTransitionView: View {
    
    @State var showText = false
    
    var body: some View {
        VStack {
            if (self.showText) {
                Text("HELLO WORLD").transition(.clipTransition)
            }
            Button(action: {
                withAnimation() {
                    self.showText.toggle()
                }
            }) {
                Text("Change me")
            }
        }.border(.orange)
    }
    
}

struct ClipEffect: ViewModifier {
    var value: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 100*(1-value)).scale(value))
    }
}

extension AnyTransition {
    static var clipTransition: AnyTransition {
        .modifier(
            active: ClipEffect(value: 0),
            identity: ClipEffect(value: 1)
        )
    }
}

struct CustomTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionView()
    }
}
