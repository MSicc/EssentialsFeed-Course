//
//  ContentView.swift
//  Prototype
//
//  Created by Marco Siccardi on 14.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 3a) Embed the storyboard VC here
            StoryboardContainer(
                storyboardName: "Main",
                viewControllerID: "MainStoryBoardVC"
            )
            .edgesIgnoringSafeArea(.all)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
