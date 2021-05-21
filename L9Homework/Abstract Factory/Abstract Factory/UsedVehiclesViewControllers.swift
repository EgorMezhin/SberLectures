//
//  ScooterViewController.swift
//  Abstract Factory
//
//  Created by Egor Lass on 19.05.2021.
//

import UIKit

final class UsedBicycleViewController: UIViewController, UsedVehicle {
    
    private let condition: VehicleCondition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 60, y: 200, width: 300, height: 25))
        label.text = "Подержанные велосипеды"
        view.addSubview(label)
       }

    init(condition: VehicleCondition) {
        self.condition = condition
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("UsedBicycleViewController: init(coder:) has not been implemented.")
    }
    
}

final class UsedScooterViewController: UIViewController, UsedVehicle {
    
    private let condition: VehicleCondition
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 300, height: 25))
        label.text = "Подержанные скутеры"
        view.addSubview(label)
       }

    init(condition: VehicleCondition) {
        self.condition = condition
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("UsedScooterViewController: init(coder:) has not been implemented.")
    }
    
}
