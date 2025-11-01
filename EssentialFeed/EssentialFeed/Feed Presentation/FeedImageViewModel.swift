//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 18.07.2025.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
