//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Marco Siccardi on 25.06.2025.
//

import Foundation
import XCTest
import EssentialFeed

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }
    
    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
