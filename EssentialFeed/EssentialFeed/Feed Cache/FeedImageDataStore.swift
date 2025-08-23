//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 23.08.2025.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>    
    typealias InsertionResult = Swift.Result<Void, Error>

    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void)
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
