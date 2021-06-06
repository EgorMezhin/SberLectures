//
//  PlayersViewController.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class PlayersViewController: UIViewController {
    
    var playerTableView: UITableView!
    var players: [Player] = []
    let apiClient: APIClient = NBAApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerTableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width:view.frame.width,
                height: view.frame.height))
        
        playerTableView.register(
            PlayerCell.self,
            forCellReuseIdentifier: "PlayerCell")
        
        playerTableView.dataSource = self
        playerTableView.delegate = self
        self.view.addSubview(playerTableView)
        
        navigationController?.navigationBar.topItem?.title = "Players"
        
        reload()
    }
    
    private func reload() {
        apiClient.getPlayers(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                case .failure:
                    self.players = []
                }
                self.playerTableView.reloadData()
            }
        })
    }
}

extension PlayersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerInfoViewController = PlayerInfoViewController()
        let player = players[indexPath.row]
        playerInfoViewController.playerNameLabel.text = player.firstName + " " + player.lastName
        playerInfoViewController.teamNameLabel.text = player.team.city
        playerInfoViewController.positionLabel.text = "Position - " + player.position
        
        navigationController?.pushViewController(playerInfoViewController, animated: false)
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let player = players[indexPath.row]
        cell.playerNameLabel.text = player.firstName + " " + player.lastName
        cell.playerTeamName.text = player.team.fullName
        cell.selectionStyle = .none
        return cell
    }
}
