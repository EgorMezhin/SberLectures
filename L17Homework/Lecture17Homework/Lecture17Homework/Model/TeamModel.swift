//
//  TeamModel.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//


struct Team: Codable {
    let id: Int
    let abbreviation: String
    let city: String
    let conference: String
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case id
        case abbreviation
        case city
        case conference
        case fullName = "full_name"
    }
}
