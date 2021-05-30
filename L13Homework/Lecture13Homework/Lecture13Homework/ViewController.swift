//
//  ViewController.swift
//  Lecture13Homework
//
//  Created by Egor Lass on 30.05.2021.
//

import UIKit

class ViewController: UIViewController {

    private lazy var treeView: UIImageView = {
        let treeImage = UIImageView(frame: CGRect(
                                        x: self.view.frame.midX,
                                        y: self.view.frame.midY,
                                        width: 0,
                                        height: 0))
        treeImage.image = UIImage(named: "tree")
        treeImage.contentMode = .scaleAspectFit
        return treeImage
    }()
    
    private lazy var bananaView: UIImageView = {
        var bananaImage = UIImageView(frame: CGRect(
                                        x: self.view.frame.midX,
                                        y: self.view.frame.midY,
                                        width: 0,
                                        height: 0))
        bananaImage.image = UIImage(named: "banana")
        bananaImage.contentMode = .scaleAspectFit
        return bananaImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(treeView)
        view.addSubview(bananaView)
        animate()
    }
    
    func animate() {
        //  treeView.layer.removeAllAnimations()
        
        UIView.animate(
            withDuration: 5,
            delay: 0,
            options: .curveEaseOut) {
            [weak self] in
            guard let self = self else { return }
            self.treeView.bounds.size.height = self.view.frame.height
            self.treeView.bounds.size.width = self.view.frame.width
        }
        
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut) {
            [weak self] in
            guard let self = self else { return }
            self.bananaView.bounds.size.height = 50
            self.bananaView.bounds.size.width = 50
        }
    }
}

