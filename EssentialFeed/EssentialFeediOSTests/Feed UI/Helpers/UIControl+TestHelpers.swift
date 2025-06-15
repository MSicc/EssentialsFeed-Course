//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Marco Siccardi on 12.06.2025.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
