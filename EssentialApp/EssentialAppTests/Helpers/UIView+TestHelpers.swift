//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Marco Siccardi on 18.09.2025.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
