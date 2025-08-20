//
//  HTTPURLResponse+StatusCode.swift .swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 20.08.2025.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
