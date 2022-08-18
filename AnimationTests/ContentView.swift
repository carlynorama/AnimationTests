//
//  ContentView.swift
//  AnimationTests
//
//  Created by Labtanza on 8/18/22.
//
// Good info on transitions https://nerdyak.tech/development/2020/10/12/transitions-in-swiftui.html

import SwiftUI

struct ContentView: View {
    var body: some View {
        DropDownOverlayTransition()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
