//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Marco Siccardi on 16.06.2025.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
