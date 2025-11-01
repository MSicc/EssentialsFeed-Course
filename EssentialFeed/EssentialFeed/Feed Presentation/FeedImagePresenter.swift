//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 18.07.2025.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
