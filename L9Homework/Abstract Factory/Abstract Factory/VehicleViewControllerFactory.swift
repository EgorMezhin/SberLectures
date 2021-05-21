//
//  VehicleViewControllerFactory.swift
//  Abstract Factory
//
//  Created by Egor Lass on 19.05.2021.
//

import UIKit

protocol VehicleViewControllerFactory {
    func makeBicycleViewController() -> UIViewController
    func makeScooterViewController() -> UIViewController
}

struct NewVehicleViewControllerFactory: VehicleViewControllerFactory {
    
    func makeBicycleViewController() -> UIViewController {
        return NewBicycleViewController(condition: .new)
    }
    func makeScooterViewController() -> UIViewController {
        return NewScooterViewController(condition: .new)
    }
}

struct UsedVehicleViewControllerFactory: VehicleViewControllerFactory {
    
    func makeBicycleViewController() -> UIViewController {
        return UsedBicycleViewController(condition: .used)
    }
    func makeScooterViewController() -> UIViewController {
        return UsedScooterViewController(condition: .used)
    }
}


