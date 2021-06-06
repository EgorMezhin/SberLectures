//
//  GameModel.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//


struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    let id: Int
    let season: Int
    let homeTeamScore: Int
    let visitorTeamScore: Int
    let homeTeam: Team
    let visitorTeam: Team
    
    enum CodingKeys: String, CodingKey {
         case id
         case season
         case homeTeamScore = "home_team_score"
         case visitorTeamScore = "visitor_team_score"
         case homeTeam = "home_team"
         case visitorTeam = "visitor_team"
     }
}
