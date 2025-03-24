//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by MSiccDev on 24.03.2025.
//

import Foundation

public final class LocalFeedLoader{
    private let store: FeedStore
    private let currentDate: () -> Date
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ items: [FeedItem], completion: @escaping (Error?) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            
            if let cachaeDeletionError = error {
                completion(cachaeDeletionError)
            } else{
                self.cache(items, with: completion)
                }
            }
        }
        
    private func cache(_ items: [FeedItem], with completion: @escaping (Error?) -> Void) {
        store.insert(items, timestamp: self.currentDate()) { [weak self ] error in
            guard self != nil else {return}
            completion(error)
        }
    }
}


