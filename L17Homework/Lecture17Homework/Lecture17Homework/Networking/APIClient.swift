//
//  APIClient.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import Foundation

class NBAApiClient: APIClient {
    
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        let session = URLSession.shared

        let url = URL(string: "https://www.balldontlie.io/api/v1/games")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(GamesResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })

        dataTask.resume()
    }
    
    func getPlayers(completion: @escaping (Result<[Player], Error>) -> Void) {
        let session = URLSession.shared

        let url = URL(string: "https://www.balldontlie.io/api/v1/players")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(PlayersResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                print(error)
                completion(.failure(error))
            }
        })

        dataTask.resume()
    }
}
