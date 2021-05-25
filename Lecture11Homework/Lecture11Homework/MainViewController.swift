//
//  ViewController.swift
//  Lecture11Homework
//
//  Created by Egor Lass on 25.05.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    let logo = UIImage(named: "google-1")
    let string = "https://www.google.com"
    
    lazy var shareButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
        button.setTitle("Google", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var activityViewController: UIActivityViewController = {
        let activity = UIActivityViewController(activityItems: [logo!, string], applicationActivities: [CustomActivity()])
        activity.excludedActivityTypes = [.postToFlickr, .postToVimeo, .saveToCameraRoll]
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        activateConstarint()
    }
    
    @objc func shareButtonPressed() {
        present(activityViewController, animated: true, completion: nil)
    }
    
    func activateConstarint() {
        NSLayoutConstraint.activate([
            shareButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            shareButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}

extension UIActivity.ActivityType {
    static let openUrl =
        UIActivity.ActivityType("url")
}

class CustomActivity: UIActivity {
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override var activityType: UIActivity.ActivityType? {
        return .openUrl
    }
    
    override var activityTitle: String? {
        return NSLocalizedString("Google", comment: "title")
    }
    
    override var activityImage: UIImage? {
        return UIImage(systemName: "magnifyingglass")
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func perform() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
}
