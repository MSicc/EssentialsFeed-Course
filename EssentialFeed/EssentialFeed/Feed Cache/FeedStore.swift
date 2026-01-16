//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by MSiccDev on 24.03.2025.
//

import Foundation

public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)


public protocol FeedStore {
    func deleteCachedFeed() throws
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws
    func retrieve() throws -> CachedFeed?
}

