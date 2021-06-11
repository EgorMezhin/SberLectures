//
//  ViewController.swift
//  Lecture20Project
//
//  Created by Egor Lass on 11.06.2021.
//

import UIKit
import MyFramework

class ViewController: UIViewController {
    
    let myClass = MyClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This framework was made by \(myClass.name)")
        myClass.sayHello()

    }
}


