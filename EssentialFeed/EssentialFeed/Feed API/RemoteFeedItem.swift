//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by MSiccDev on 25.03.2025.
//

import Foundation

 struct RemoteFeedItem : Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
