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
    
    public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load(){
        client.get(from: url)
    }
}

public protocol HttpClient {
       
    func get(from url: URL)
}
