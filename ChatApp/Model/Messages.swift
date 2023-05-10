//
//  Messages.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/09.
//

import Foundation

struct Messages: Codable {
    var id: String
    var userProfile: UserProfile
    var message: Message
    var isNew: Bool
}

struct Chat: Codable {
    var id: String
    var userProfile: UserProfile
    var chat: [Message]
}

struct UserProfile: Codable {
    var name: String
    var description: String
    var profileImageURL: String?
}

struct Message: Codable {
    var content: String
    var created: Date
    var sender: String
}
