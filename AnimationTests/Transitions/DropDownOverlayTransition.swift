//
//  DropDownOverlayTransition.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
//

import SwiftUI

struct DropDownOverlayTransition: View {
    @State var showDropDown = true
    @State var textFieldText = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
            Circle().fill(LinearGradient(colors: [.cyan, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack {
                Button("Toggle Dropdown") {
                    withAnimation {
                        showDropDown.toggle()
                    }
                }
                    .buttonStyle(.borderedProminent)
                    .padding(5)
                ViewWithDropDown()
                    .zIndex(3) //is on the _parent_ of the overlay.
                    .overlay(alignment:.bottom) {
                        ZStack {
                            if showDropDown {
                                ViewToDropDown().transition(menuTransition)
                            }
                        }.alignmentGuide(.bottom) { $0[VerticalAlignment.top] }
                    }
                Rectangle().fill(.ultraThinMaterial)
            }
        }
    }
    
    
    var menuTransition:AnyTransition {
        //AnyTransition.scale(scale: 2, anchor: UnitPoint(x: 1, y: 0))
        AnyTransition.opacity.combined(with: .move(edge: .top)).combined(with: verticalClipTransition)
    }
    
    struct VerticalClipEffect:ViewModifier {
        var value: CGFloat
        
        func body(content: Content) -> some View {
            content
                .clipShape(Rectangle().scale(x: 1, y: value, anchor: .top))
        }
    }
    
    var verticalClipTransition:AnyTransition {
        .modifier(
            active: VerticalClipEffect(value: 0),
            identity: VerticalClipEffect(value: 1)
        )
    }
    
    
    struct ViewWithDropDown:View {
        var body: some View {
            Text("This item has info that will drop down.")
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 5.0).fill(.gray))
        }
    }
    
    struct ViewToDropDown:View {
        var body: some View {
                Rectangle()
                    .fill(.blue)
                    .frame(height: 50)
        }
    }
}

struct DropDownOverlayTransition_Previews:PreviewProvider {
    static var previews: some View {
        DropDownOverlayTransition()
    }
}
