//
//  FeedImageDataStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Marco Siccardi on 17.01.2026.
//

import Foundation

protocol FeedImageDataStoreSpecs {
    func test_retrieveImageData_deliversNotFoundWhenEmpty() async throws
    func test_retrieveImageData_deliversNotFoundWhenStoredDataURLDoesNotMatch() async throws
    func test_retrieveImageData_deliversFoundDataWhenThereIsAStoredImageDataMatchingURL() async throws
    func test_retrieveImageData_deliversLastInsertedValue() async throws
}
