//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Marco Siccardi on 12.06.2025.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
