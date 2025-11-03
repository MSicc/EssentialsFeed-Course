//
//  UITableView+Dequeuing.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 24.06.2025.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
