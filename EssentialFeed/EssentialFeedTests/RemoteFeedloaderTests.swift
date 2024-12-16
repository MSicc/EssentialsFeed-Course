

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest

class RemoteFeedloader {
    func load(){
        HttpClient.shared.requestedUrl = URL(string: "https://a-url.com")
    }
}

class HttpClient {
    static let shared = HttpClient()
    
    private init() {}
    
    var requestedUrl: URL?
}


class RemoteFeedloaderTests: XCTestCase {

    
    
    func test_init_doesNotRequestDataFromUrl() {
        let client = HttpClient.shared
        _ = RemoteFeedloader()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let client = HttpClient.shared
        let sut = RemoteFeedloader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }

}
