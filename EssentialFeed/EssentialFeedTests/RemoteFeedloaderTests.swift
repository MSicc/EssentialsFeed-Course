

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest

class RemoteFeedloader {
    func load(){
        HttpClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HttpClient {
    static var shared = HttpClient()
    
    func get(from url: URL){}
}

class HttpClientSpy : HttpClient {
    override func get(from url: URL){
        requestedUrl = url
    }
    
    var requestedUrl: URL?
}


class RemoteFeedloaderTests: XCTestCase {

    
    
    func test_init_doesNotRequestDataFromUrl() {
        let client = HttpClientSpy()
        HttpClient.shared = client
        _ = RemoteFeedloader()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let client = HttpClientSpy()
        HttpClient.shared = client
        let sut = RemoteFeedloader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }

}
