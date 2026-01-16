//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 12.06.2025.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
