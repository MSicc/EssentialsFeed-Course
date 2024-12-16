

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest

class RemoteFeedloader {
    
}

class HttpClient {
    var requestedUrl: URL?
}


class RemoteFeedloaderTests: XCTestCase {

    
    
    func test_init_doesNotRequestDataFromUrl() {
        let client = HttpClient()
        _ = RemoteFeedloader()
        
        XCTAssertNil(client.requestedUrl)
    }

}
