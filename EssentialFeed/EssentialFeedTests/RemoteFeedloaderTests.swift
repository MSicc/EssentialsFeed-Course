

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




class RemoteFeedloaderTests: XCTestCase {

    
    
    func test_init_doesNotRequestDataFromUrl() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedUrl)
    }
    
    func test_load_requestsDataFromUrl() {
        let url = URL(string: "https://a-given-url.com")!

        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedUrl, url)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedloader, client: HttpClientSpy) {
        let client = HttpClientSpy()
        let sut = RemoteFeedloader(url: url, client: client)
        return (sut, client)
    }
    
    private class HttpClientSpy : HttpClient {
        var requestedUrl: URL?
        
        func get(from url: URL){
            requestedUrl = url
        }        
    }

}
