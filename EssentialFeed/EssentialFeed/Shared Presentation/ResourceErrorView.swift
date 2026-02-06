//
//  ResourceErrorView.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 30.10.2025.
//

import Foundation

@MainActor
public protocol ResourceErrorView {
    func display(_ viewModel: ResourceErrorViewModel)
}
