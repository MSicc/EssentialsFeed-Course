//
//  CodableFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 09.04.2025.
//

import XCTest
import EssentialFeed

class CodableFeedStore {
    func retrieve(completion: @escaping FeedStore.RetrievalCompletion){
        completion(.empty)
    }
}

class CodeableFeedStoreTests: XCTestCase {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = CodableFeedStore()
        let exp = expectation(description: "Wait for cache retrieval")
        
        sut.retrieve { result in
            switch result {
            case .empty:
                break;
                
            default :
                XCTFail("Expected empty reuslt, got \(result) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
    
}
