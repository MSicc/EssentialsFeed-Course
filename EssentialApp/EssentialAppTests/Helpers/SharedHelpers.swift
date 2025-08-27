//
//  SharedHelpers.swift
//  EssentialAppTests
//
//  Created by Marco Siccardi on 27.08.2025.
//

import Foundation


 public func anyData() -> Data {
     return Data("any data".utf8)
 }
 
 public  func anyURL() -> URL {
     return URL(string: "http://a-url.com")!
 }
 
 public func anyNSError() -> NSError {
     return NSError(domain: "any error", code: 0)
 }
