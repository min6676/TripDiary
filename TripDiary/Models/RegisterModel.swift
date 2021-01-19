//
//  RegisterModel.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/20.
//

import Foundation

struct RegisterModel: Encodable {
    let id: String
    let password: String
}

struct ResponseModel: Codable {
    let lastLogin: Int
    let userStatus: String
    let created: Int
    let welcomeClass, blUserLocale, id, userToken: String
    let ownerID, socialAccount: String
    let objectID: String

    enum CodingKeys: String, CodingKey {
        case lastLogin, userStatus, created
        case welcomeClass = "___class"
        case blUserLocale, id
        case userToken = "user-token"
        case ownerID = "ownerId"
        case socialAccount
        case objectID = "objectId"
    }
}
