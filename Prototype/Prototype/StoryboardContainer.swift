//
//  StoryboardContainer.swift
//  Prototype
//
//  Created by Marco Siccardi on 14.05.2025.
//

import SwiftUI
import UIKit

struct StoryboardContainer: UIViewControllerRepresentable {
    let storyboardName: String
    let viewControllerID: String

    func makeUIViewController(context: Context) -> UIViewController {
        // 2a) Load the storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        // 2b) Instantiate your VC by its Storyboard ID
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No dynamic updates needed for this simple embed
    }
}
