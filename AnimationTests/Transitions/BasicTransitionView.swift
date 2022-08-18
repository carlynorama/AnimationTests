//
//  BasicTransitionView.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
//

import SwiftUI

struct BasicTransitionView: View {
    @State var showText = false
    
    var body: some View {
        VStack {
            if (showText) {
                Text("HELLO WORLD")//.transition(.move(edge: .leading))
                    .transition( AnyTransition.asymmetric(insertion: .scale, removal: .opacity))
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

struct BasicTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        BasicTransitionView()
    }
}
