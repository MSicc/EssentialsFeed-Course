//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by MSiccDev on 20.01.2025.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL) async throws -> (Data, HTTPURLResponse)
}
