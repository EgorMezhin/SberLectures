//
//  BicycleViewController.swift
//  Abstract Factory
//
//  Created by Egor Lass on 19.05.2021.
//

import UIKit

final class NewBicycleViewController: UIViewController, NewVehicle {
    
    private let condition: VehicleCondition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 200, height: 25))
        label.text = "Новые велосипеды"
        view.addSubview(label)
       }

    init(condition: VehicleCondition) {
        self.condition = condition
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("NewBicycleViewController: init(coder:) has not been implemented.")
    }
    
}

final class NewScooterViewController: UIViewController, NewVehicle {
    
    private let condition: VehicleCondition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 90, y: 200, width: 200, height: 25))
        label.text = "Новые скутеры"
        view.addSubview(label)
       }

    init(condition: VehicleCondition) {
        self.condition = condition
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("NewScooterViewController: init(coder:) has not been implemented.")
    }
    
}


