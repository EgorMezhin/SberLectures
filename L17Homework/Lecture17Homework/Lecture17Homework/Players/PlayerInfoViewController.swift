//
//  PlayerInfoViewController.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class PlayerInfoViewController: UIViewController {
    
    var playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jimmy Butler"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Miami Heat"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    let positionLabel: UILabel = {
        let label = UILabel()
        label.text = "PG"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(playerNameLabel)
        view.addSubview(teamNameLabel)
        view.addSubview(positionLabel)
        
        setConstraint()
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            playerNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            playerNameLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 100),
        
            teamNameLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            teamNameLabel.topAnchor.constraint(
                equalTo: playerNameLabel.bottomAnchor,
                constant: 20),
            
            positionLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            positionLabel.topAnchor.constraint(
                equalTo: teamNameLabel.bottomAnchor,
                constant: 20)
        
        ])
    }
}
