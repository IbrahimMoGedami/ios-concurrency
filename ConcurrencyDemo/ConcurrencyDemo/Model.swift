//
//  Model.swift
//  ConcurrencyDemo
//
//  Created by Ibrahim Mo Gedami on 13/01/2022.
//

import Foundation

struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
