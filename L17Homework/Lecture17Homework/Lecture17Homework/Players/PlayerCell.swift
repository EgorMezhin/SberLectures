//
//  PlayerCell.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    let playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "LeBron James"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    let playerTeamName: UILabel = {
        let label = UILabel()
        label.text = "Los Angeles Lakers"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(playerTeamName)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            playerNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16),
            playerNameLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10),
            playerNameLabel.widthAnchor.constraint(
                equalToConstant: 200),
        
            playerTeamName.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16),
            playerTeamName.topAnchor.constraint(
                equalTo: playerNameLabel.bottomAnchor,
                constant: 10),
            playerTeamName.widthAnchor.constraint(
                equalToConstant: 200)
        ])
    }
}
