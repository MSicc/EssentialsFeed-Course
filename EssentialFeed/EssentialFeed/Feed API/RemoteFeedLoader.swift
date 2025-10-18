//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by MSiccDev on 07.01.2025.
//

import Foundation


public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
