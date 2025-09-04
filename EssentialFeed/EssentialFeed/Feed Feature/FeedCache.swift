//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 03.09.2025.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
