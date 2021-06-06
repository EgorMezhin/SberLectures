//
//  GameCell.swift
//  Lecture17Homework
//
//  Created by Egor Lass on 06.06.2021.
//

import UIKit

class GameCell: UITableViewCell {
    
    let gameTtleLabel: UILabel = {
        let label = UILabel()
        label.text = "Team 1 vs Team 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "112 : 110"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(gameTtleLabel)
        contentView.addSubview(scoreLabel)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            gameTtleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16),
            gameTtleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10),
            gameTtleLabel.widthAnchor.constraint(
                equalToConstant: 200),
            
            scoreLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16),
            scoreLabel.topAnchor.constraint(
                equalTo: gameTtleLabel.bottomAnchor,
                constant: 10),
            scoreLabel.widthAnchor.constraint(
                equalToConstant: 200)
        ])
    }
    
}


