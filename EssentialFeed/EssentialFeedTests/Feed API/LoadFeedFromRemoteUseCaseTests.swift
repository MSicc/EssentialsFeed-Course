

//
//  RemoteFeedloaderTests.swift
//  EssentialFeedTests
//
//  Created by MSiccDev on 16.12.2024.
//

import XCTest
import EssentialFeed

class LoadFeedFromRemoteUseCaseTests: XCTestCase {
        
    func test_load_deliversErrorOnNon200HTTPResponse() {
        let (sut, client) = makeSUT()
        
        let samples = [199,201,300,400,500]
        
        samples.enumerated().forEach { index, code in
            expect(sut, toCompleteWith: failure(.invalidData), when: {
                let json = makeItemJson([])
                client.complete(withStatusCode: code, data:json, at: index)
            })
        }
    }
    
    func test_load_deliversErrorOn200HTtpResponseWithInvalidJson() {
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWith: failure(.invalidData), when: {
            let invalidJson = Data("Invalid JSON".utf8)
            client.complete(withStatusCode: 200, data: invalidJson)
        })
    }
    
    func test_load_deliversNoItemsOn200HTTPResponsWithEmptyJsonList(){
        let (sut, client) = makeSUT()
        
        expect(sut, toCompleteWith: .success([]), when: {
            let emptyListJson = makeItemJson([])
            client.complete(withStatusCode: 200, data: emptyListJson)
        })
    }
    
    func test_load_deliversITemsOn200HTTPResponsWithJsonItems(){
        let (sut, client) = makeSUT()
        
        let item1 = makeItem(
            id: UUID(),
            imageUrl: URL(string: "http://a-url.com")!)

        
        let item2 = makeItem(
            id: UUID(),
            description: "a description",
            location: "a location",
            imageUrl: URL(string: "http://another-url.com")!)
                
        let items = [item1.model, item2.model]
        
        expect(sut, toCompleteWith: .success(items), when: {
            let json = makeItemJson([item1.json, item2.json])
            client.complete(withStatusCode: 200, data: json)
        })
    }
       
    
    //MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(client, file: file, line: line)
        return (sut, client)
    }
    
    private func failure(_ error: RemoteFeedLoader.Error) -> RemoteFeedLoader.Result {
        return .failure(error)
    }
    
    
    private func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageUrl: URL) -> (model: FeedImage, json: [String: Any]) {
        let item = FeedImage(id: id, description: description, location: location, url: imageUrl)
        let json = [
            "id" : id.uuidString,
            "description" : description,
            "location" : location,
            "image": imageUrl.absoluteString
        ].compactMapValues { $0 }
        
        return (item, json)
    }
    
    private func makeItemJson(_ items: [[String: Any]]) -> Data {
        let json = ["items": items]
        return try! JSONSerialization.data(withJSONObject: json)
    }
    
    private func expect(_ sut: RemoteFeedLoader, toCompleteWith expectedResult: RemoteFeedLoader.Result, when action: () -> Void, file: StaticString = #file, line: UInt = #line)
    {
        let exp = expectation(description: "Wait for completion")
        
        sut.load { receivedResult in
            switch (receivedResult, expectedResult){
            case let (.success(receivedItems), .success(expectedItems)):
                XCTAssertEqual(receivedItems, expectedItems, file: file, line: line)
            case let (.failure(receivedError as RemoteFeedLoader.Error), .failure(expectedError as RemoteFeedLoader.Error)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)
            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead.", file: file, line: line)
                
            }
            
            exp.fulfill()
        }
    
        
        action()
        
        wait(for: [exp], timeout: 1.0)
    
    }
    
}
