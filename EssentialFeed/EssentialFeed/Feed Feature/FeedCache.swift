//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 03.09.2025.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
