//
//  NullStore.swift
//  EssentialApp
//
//  Created by Marco Siccardi on 06.01.2026.
//

import Foundation
import EssentialFeed

class NullStore {}

extension NullStore: FeedStore {
    func deleteCachedFeed() throws {}
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws {}
    
    func retrieve() throws -> CachedFeed? { .none }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}
    
    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
