//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 17.07.2025.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
