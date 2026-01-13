//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 04.09.2025.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
