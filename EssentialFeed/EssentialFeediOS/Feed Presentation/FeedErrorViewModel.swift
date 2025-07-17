//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 17.07.2025.
//


struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
