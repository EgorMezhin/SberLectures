//
//  ViewController.swift
//  Abstract Factory
//
//  Created by Egor Lass on 19.05.2021.
//

// Попытался использовать Abstract Factory + Mediator. Abstract Factory для разных viewcontrollers
// Mediator для связи между чекбоксом и кнопками перехода на другие viewcontrollers.

import UIKit

class MainViewController: UIViewController {
    
    let component1 = Component1()
    let component2 = Component2()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: view.frame.size.width / 2 - 100, y: 206, width: 40, height: 25))
        label.text = "Б/У"
        label.textColor = .black
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let checkButton = UIButton(frame: CGRect(x: view.frame.size.width / 2 - 70, y: 200, width: 40, height: 40))
        checkButton.addTarget(self, action: #selector(self.clickOnCheckMark), for: .touchUpInside)
        checkButton.setImage(UIImage.init(named: "Checkmarkempty"), for: UIControl.State.normal)
        checkButton.setImage(UIImage.init(named: "Checkmark"), for: UIControl.State.selected)
        return checkButton
    }()
    
    lazy var scooterButton: UIButton = {
        let scooterButton = UIButton(frame: CGRect(x: self.view.center.x - 100, y: 300, width: 200, height: 25))
        scooterButton.backgroundColor = .gray
        scooterButton.setTitle("Купить скутер", for: .normal)
        scooterButton.addTarget(self, action: #selector(createNewScooterViewController), for: .touchUpInside)
        return scooterButton
    }()
    
    lazy var bicycleButton: UIButton = {
        let bicycleButton = UIButton(frame: CGRect(x: self.view.center.x - 100, y: 250, width: 200, height: 25))
        bicycleButton.backgroundColor = .gray
        bicycleButton.setTitle("Купить велосипед", for: .normal)
        bicycleButton.addTarget(self, action: #selector(createNewBicycleViewController), for: .touchUpInside)
        return bicycleButton
        }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(checkButton)
        view.addSubview(scooterButton)
        view.addSubview(bicycleButton)
    }
    
    @objc func clickOnCheckMark(sender:UIButton) {
        let mediator = ConcreteMediator(component1, component2)
        if sender.isSelected == false {
            sender.isSelected = true
            component1.selectNew()
            print("component2 new = \(component2.new)")
            print("component2 used = \(component2.used)")
            if component2.new {
                bicycleButton.removeTarget(self, action: nil, for: .allEvents)
                bicycleButton.addTarget(self, action: #selector(createUsedBicycleViewController), for: .touchUpInside)
                scooterButton.removeTarget(self, action: nil, for: .allEvents)
                scooterButton.addTarget(self, action: #selector(createUsedScooterViewController), for: .touchUpInside)
            } else {
                bicycleButton.removeTarget(self, action: nil, for: .allEvents)
                bicycleButton.addTarget(self, action: #selector(createNewBicycleViewController), for: .touchUpInside)
                scooterButton.removeTarget(self, action: nil, for: .allEvents)
                scooterButton.addTarget(self, action: #selector(createNewScooterViewController), for: .touchUpInside)
            }
        } else {
            sender.isSelected = false
            component1.selectUsed()
            print("component2 new = \(component2.new)")
            print("component2 used = \(component2.used)")
            if component2.used {
                bicycleButton.removeTarget(self, action: nil, for: .allEvents)
                bicycleButton.addTarget(self, action: #selector(createNewBicycleViewController), for: .touchUpInside)
                scooterButton.removeTarget(self, action: nil, for: .allEvents)
                scooterButton.addTarget(self, action: #selector(createNewScooterViewController), for: .touchUpInside)
            } else {
                bicycleButton.removeTarget(self, action: nil, for: .allEvents)
                bicycleButton.addTarget(self, action: #selector(createUsedBicycleViewController), for: .touchUpInside)
                scooterButton.removeTarget(self, action: nil, for: .allEvents)
                scooterButton.addTarget(self, action: #selector(createUsedScooterViewController), for: .touchUpInside)
            }
        }
    }
    
    @objc func createNewBicycleViewController(sender: UIButton!) {
        let factory: VehicleViewControllerFactory = NewVehicleViewControllerFactory()
        let vc = factory.makeBicycleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func createNewScooterViewController(sender: UIButton!) {
        let factory: VehicleViewControllerFactory = NewVehicleViewControllerFactory()
        let vc = factory.makeScooterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func createUsedBicycleViewController(sender: UIButton!) {
        let factory: VehicleViewControllerFactory = UsedVehicleViewControllerFactory()
        let vc = factory.makeBicycleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func createUsedScooterViewController(sender: UIButton!) {
        let factory: VehicleViewControllerFactory = UsedVehicleViewControllerFactory()
        let vc = factory.makeScooterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

