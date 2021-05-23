//
//  ViewController.swift
//  Lecture10Homework
//
//  Created by Egor Lass on 22.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 110,
                                            y: 235,
                                            width: 100,
                                            height: 100))
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.transitionToNextVC), for: .touchUpInside)
        return button
    }()
    
    lazy var donutView: Donut = {
        let donut = Donut(frame: CGRect(x: view.frame.midX - 150,
                                        y: view.frame.midY - 300,
                                        width: 300,
                                        height: 300))
        return donut
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(donutView)
        view.insertSubview(button, belowSubview: donutView)
    }
    
    @objc func transitionToNextVC (sender: UIButton) {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: false)
    }
}

class Donut: UIView {
    
    let outerLine: CAShapeLayer = {
        let outerCirclePath = UIBezierPath(arcCenter: CGPoint(x: 150, y: 300),
                                           radius: CGFloat(80),
                                           startAngle: CGFloat(0),
                                           endAngle: CGFloat(Double.pi * 2),
                                           clockwise: true)
        let outerCircleShapeLayer = CAShapeLayer()
        outerCircleShapeLayer.path = outerCirclePath.cgPath
        outerCircleShapeLayer.strokeColor = UIColor.clear.cgColor
        outerCircleShapeLayer.strokeColor = UIColor.brown.cgColor
        return outerCircleShapeLayer
    }()
    
    let innerLine: CAShapeLayer = {
        let innerCirclePath = UIBezierPath(arcCenter: CGPoint(x: 150, y: 300),
                                           radius: CGFloat(50),
                                           startAngle: CGFloat(0),
                                           endAngle: CGFloat(Double.pi * 2),
                                           clockwise: true)
        let innerCircleShapeLayer = CAShapeLayer()
        innerCircleShapeLayer.path = innerCirclePath.cgPath
        innerCircleShapeLayer.fillColor = UIColor.clear.cgColor
        innerCircleShapeLayer.lineWidth = 1
        innerCircleShapeLayer.strokeColor = UIColor.white.cgColor
        return innerCircleShapeLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(outerLine)
        layer.addSublayer(innerLine)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


