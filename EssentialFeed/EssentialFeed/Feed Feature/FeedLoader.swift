//
//  Copyright © Essential Developer. All rights reserved.
//

import Foundation

public enum LoadFeedResult<Error : Swift.Error> {
	case success([FeedItem])
	case failure(Error)
}

extension LoadFeedResult: Equatable  where Error : Equatable {}

protocol FeedLoader : Equatable where Error : Equatable{
    associatedtype Error: Swift.Error
    
	func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
