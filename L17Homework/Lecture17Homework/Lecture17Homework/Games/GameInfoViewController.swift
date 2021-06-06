//
//  GameInfoViewController.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class GameInfoViewController: UIViewController {

    var gameNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Team 1 vs Team 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(16)
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "112 : 110"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(22)
        return label
    }()
    
    let seasonLabel: UILabel = {
        let label = UILabel()
        label.text = "2018"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(gameNameLabel)
        view.addSubview(scoreLabel)
        view.addSubview(seasonLabel)
        
        setConstraint()
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            gameNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            gameNameLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 100),
        
            scoreLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            scoreLabel.topAnchor.constraint(
                equalTo: gameNameLabel.bottomAnchor,
                constant: 20),
            
            seasonLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            seasonLabel.topAnchor.constraint(
                equalTo: scoreLabel.bottomAnchor,
                constant: 20)
        
        ])
    }
}
