//
//  CountingUpTransitionView.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
//

import SwiftUI

struct CountingUpTransitionView: View {
    @State var showText = false
    @State var textValue = 100.0
    
    var body: some View {
        VStack {
            if (self.showText) {
 
                Rectangle().transition(AnyTransition.countUpTransition(value: textValue).combined(with: .scale))
            }
            Button(action: {
                withAnimation() {
                    self.showText.toggle()
                }
            }) {
                Text("Change Me")
            }
        }.border(.green)
    }
}

extension AnyTransition {
    static func countUpTransition(value: CGFloat)->AnyTransition {
        return AnyTransition.modifier(
            active: CountUpEffect(value: 0),
            identity: CountUpEffect(value: value))
    }
}

//View in body of modifier wins because content is not used.
struct CountUpEffect: AnimatableModifier {
    var value: CGFloat
    
    var animatableData: CGFloat {
        get { return value }
        set { value = newValue }
    }
    
    func body(content: Content) -> some View {
        Text("\(value, specifier: "%.1f")")
            .font(.title)
            .foregroundColor(value<100 ? .primary : .red)
    }
}

struct CountingUpTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        CountingUpTransitionView()
    }
}
