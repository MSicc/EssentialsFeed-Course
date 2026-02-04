//
//  ImageComment.swift
//  EssentialFeed
//
//  Created by Marco Siccardi on 15.10.2025.
//


import Foundation

public struct ImageComment: Equatable, Sendable {
    public let id: UUID
    public let message: String
    public let createdAt: Date
    public let username: String

    public init(id: UUID, message: String, createdAt: Date, username: String) {
        self.id = id
        self.message = message
        self.createdAt = createdAt
        self.username = username
    }
}
