

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest
import EssentialFeed

class RemoteFeedloaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromUrl() {
        let (_, client) = makeSUT()
        
        XCTAssertTrue(client.requestedUrls.isEmpty)
    }
    
    func test_load_requestsDataFromUrl() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load { _ in }
        
        XCTAssertEqual(client.requestedUrls, [url])
    }
    
    func test_loadTwice_requestsDataFromUrl() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load { _ in }
        sut.load { _ in }
        
        XCTAssertEqual(client.requestedUrls, [url, url])
    }
    
    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithError: .connectivity, when: {
            let clientError = NSError(domain: "Test", code: 0)
            client.complete(with: clientError)
        })
    }
    
    func test_load_deliversErrorOnNon200HTTPResponse() {
        let (sut, client) = makeSUT()
        
        let samples = [199,201,300,400,500]
        
        samples.enumerated().forEach { index, code in
            expect(sut, toCompleteWithError: .invalidData, when: {
                client.complete(withStatusCode: code, at: index)
            })
        }
    }
    
    func test_load_deliversErrorOn200HTtpResponseWithInvalidJson() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWithError: .invalidData) {
            let invalidJson = Data("Invalid JSON".utf8)
            client.complete(withStatusCode: 200, data: invalidJson)
        }
    }
    
    func test_load_deliversNoItemsOn200HTTPResponsWithEmptyJsonList(){
        let (sut, client) = makeSUT()
        
        var capturedResults = [RemoteFeedLoader.Result]()
        sut.load { capturedResults.append($0) }
        
        let emptyListJson = Data(_ : "{\"items\":[]}".utf8)
        client.complete(withStatusCode: 200, data: emptyListJson)
        
        XCTAssertEqual(capturedResults, [.success([])])
    }
    
    
    //MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HttpClientSpy) {
        let client = HttpClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private func expect(_ sut: RemoteFeedLoader, toCompleteWithError error: RemoteFeedLoader.Error, when action: () -> Void, file: StaticString = #file, line: UInt = #line)
    {
        var capturedResults = [RemoteFeedLoader.Result]()
        sut.load { capturedResults.append($0) }
        
        action()
        
        XCTAssertEqual(capturedResults, [.failure(error)], file: file, line: line)
    }
    
    private class HttpClientSpy : HttpClient {

        private var messages = [(url: URL, completion: (HTTPClientResult) -> Void)]()
        
        var requestedUrls: [URL]{
            return messages.map { $0.url }
        }
        
        func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void){
            messages.append((url, completion))
        }
        
        func complete(with error: Error, at index: Int = 0) {
            messages[index].completion(.failure(error))
        }
        
        func complete(withStatusCode code: Int, data: Data = Data(), at index: Int = 0) {
            let response =
            HTTPURLResponse(url: requestedUrls[index],
                            statusCode: code,
                            httpVersion: nil,
                            headerFields: nil)!
            messages[index].completion(.success(data,  response))
            
        }
    }

}
