//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 23.08.2025.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
