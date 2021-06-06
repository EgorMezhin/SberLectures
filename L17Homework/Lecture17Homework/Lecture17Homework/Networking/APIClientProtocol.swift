//
//  APIClientProtocol.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import Foundation

protocol APIClient {
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void)
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void)
}
