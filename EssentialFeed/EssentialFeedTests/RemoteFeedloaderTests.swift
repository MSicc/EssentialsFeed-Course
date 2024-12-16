

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest

class RemoteFeedloader {
    let client: HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load(){
        client.get(from: url)
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
        let url = URL(string: "https://a-url.com")!
        let client = HttpClientSpy()
        _ = RemoteFeedloader(url: url, client: client)
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let url = URL(string: "https://a-given-url.com")!
        let client = HttpClientSpy()
        let sut = RemoteFeedloader(url: url, client: client)
        
        sut.load()
        
        XCTAssertEqual(client.requestedUrl, url)
    }

}
