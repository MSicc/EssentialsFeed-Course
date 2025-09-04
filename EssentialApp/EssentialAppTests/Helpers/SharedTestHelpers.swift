//
//  SharedHelpers.swift
//  EssentialAppTests
//
//  Created by Marco Siccardi on 27.08.2025.
//

import Foundation
import EssentialFeed


 func anyData() -> Data {
     return Data("any data".utf8)
 }
 
 func anyURL() -> URL {
     return URL(string: "http://a-url.com")!
 }
 
 func anyNSError() -> NSError {
     return NSError(domain: "any error", code: 0)
 }

func uniqueFeed() -> [FeedImage] {
    return [FeedImage(id: UUID(), description: "any", location: "any", url: URL(string: "http://any-url.com")!)]
}
