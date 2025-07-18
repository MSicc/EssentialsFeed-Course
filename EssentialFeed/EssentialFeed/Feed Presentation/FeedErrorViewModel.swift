//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 15.07.2025.
//

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
