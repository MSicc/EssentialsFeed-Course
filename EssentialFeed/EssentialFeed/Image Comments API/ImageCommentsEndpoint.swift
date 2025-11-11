//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 11.11.2025.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
