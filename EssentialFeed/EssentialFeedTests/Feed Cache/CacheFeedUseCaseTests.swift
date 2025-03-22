//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 22.03.2025.
//

import XCTest

class LocalFeedLoader{
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests : XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
}
