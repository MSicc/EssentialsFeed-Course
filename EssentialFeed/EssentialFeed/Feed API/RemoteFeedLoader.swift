//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by MSiccDev on 07.01.2025.
//

import Foundation



public final class RemoteFeedLoader {
    private let url: URL
    private let client: HttpClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public enum Result : Equatable {
        case success([FeedItem])
        case failure(Error)
    }
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url){ result in
            switch result {
            case let .success(data, response):
                if let items = try? FeedItemsMapper.map(data, response) {
                    completion(.success(items))
                }else{
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}

