//
//  CustomCollectionViewCell.swift
//  Lecture19Homework
//
//  Created by Egor Lass on 21.06.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let id = "CustomCell"
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let filterNameLabel: UILabel = {
        let filterNameLabel = UILabel()
        filterNameLabel.textColor = .black
        filterNameLabel.backgroundColor = .white
        filterNameLabel.textAlignment = .center
        filterNameLabel.adjustsFontSizeToFitWidth = true
        filterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return filterNameLabel
    }()
    
    func insertData(filterModel: FilterModel, index: Int) {
        cellImageView.image = filterModel.images[index]
        filterNameLabel.text = "\(filterModel.filterNames[index])"
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            cellImageView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            cellImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            cellImageView.bottomAnchor.constraint(
                equalTo: filterNameLabel.topAnchor),

            filterNameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            filterNameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(cellImageView)
        addSubview(filterNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
