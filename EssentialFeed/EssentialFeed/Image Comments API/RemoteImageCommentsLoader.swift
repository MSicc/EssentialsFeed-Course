//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 15.10.2025.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}

