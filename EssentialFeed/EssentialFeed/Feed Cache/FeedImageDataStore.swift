//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 23.08.2025.
//

import Foundation

public protocol FeedImageDataStore {
    
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
