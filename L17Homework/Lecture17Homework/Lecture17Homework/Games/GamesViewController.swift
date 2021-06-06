//
//  GamesViewController.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class GamesViewController: UIViewController {
    
    var gamesTableView: UITableView!
    var games: [Game] = []
    let apiClient: APIClient = NBAApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamesTableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width:view.frame.width,
                height: view.frame.height))
        
        gamesTableView.register(
            GameCell.self,
            forCellReuseIdentifier: "GameCell")
        
        gamesTableView.dataSource = self
        gamesTableView.delegate = self
        self.view.addSubview(gamesTableView)
        
        navigationController?.navigationBar.topItem?.title = "Games"
        
        reload()
    }
    
    private func reload() {
        apiClient.getGames(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let games):
                    self.games = games
                case .failure:
                    self.games = []
                }
                self.gamesTableView.reloadData()
            }
        })
    }
}

extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameInfoViewController = GameInfoViewController()
        let game = games[indexPath.row]
        gameInfoViewController.gameNameLabel.text = game.homeTeam.fullName + " vs " + game.visitorTeam.fullName
        gameInfoViewController.scoreLabel.text = String(game.homeTeamScore) + " : " + String(game.visitorTeamScore)
        gameInfoViewController.seasonLabel.text = "Season " + String(game.season)
        navigationController?.pushViewController(gameInfoViewController, animated: false)
    }
}

extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        let game = games[indexPath.row]
        cell.gameTtleLabel.text = game.homeTeam.abbreviation + " vs " + game.visitorTeam.abbreviation
        cell.scoreLabel.text = "\(String(game.homeTeamScore)) : \(String(game.visitorTeamScore))"
        cell.selectionStyle = .none
        return cell
    }
}
