//
//  CityInfoViewController.swift
//  Lect14Test
//
//  Created by Artem  on 25.05.2021.
//

import UIKit

class CityInfoViewController: UIViewController {
    var cityName = "placeholder"
    var imageName = UIImage(named: "placeholder")
    
    var imageView: UIImageView = {
        let view = UIImageView(frame: CGRect(
                                x: 0,
                                y: UIScreen.main.bounds.height / 2 - 100,
                                width: UIScreen.main.bounds.width,
                                height: 200))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageView.image = imageName
        view.addSubview(imageView)
        navigationController?.navigationBar.topItem?.title = cityName
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}
