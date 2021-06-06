//
//  PlayerModel.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//


struct PlayersResponse: Codable {
    let data: [Player]
}

struct Player: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let team: Team

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position
        case team
    }
}
