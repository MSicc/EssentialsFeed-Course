

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest

class RemoteFeedloader {
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
    
    func load(){
        client.get(from: URL(string: "https://a-url.com")!)
    }
}

protocol HttpClient {
       
    func get(from url: URL)
}

class HttpClientSpy : HttpClient {
    func get(from url: URL){
        requestedUrl = url
    }
    
    var requestedUrl: URL?
}


class RemoteFeedloaderTests: XCTestCase {

    
    
    func test_init_doesNotRequestDataFromUrl() {
        let client = HttpClientSpy()
        _ = RemoteFeedloader(client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let client = HttpClientSpy()
        let sut = RemoteFeedloader(client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedUrl)
    }

}
