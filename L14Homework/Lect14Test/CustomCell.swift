//
//  CustomCell .swift
//  Lect14Test
//
//  Created by Artem  on 25.05.2021.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var checker = false
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(20)
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("❌", for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cityLabel)
        contentView.addSubview(button)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityLabel.widthAnchor.constraint(equalToConstant: 150),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: cityLabel.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.bottomAnchor.constraint(equalTo: cityLabel.bottomAnchor)
        ])
    }
    
    @objc func buttonTapped() {
        checker.toggle()
        button.setTitle(checker ? "❌" : "✅", for: .normal)
        contentView.backgroundColor = checker ? .clear : .green
    }
}
