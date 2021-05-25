//
//  ViewController.swift
//  Lect14Test
//
//  Created by Egor Lass on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var myTableView: UITableView!
    
    let places: [CityInfo] = [
        CityInfo(cityName: "Moscow", cityImage: UIImage(named: "Moscow")!),
        CityInfo(cityName: "Paris", cityImage: UIImage(named: "Paris")!),
        CityInfo(cityName: "Chicago", cityImage: UIImage(named: "Chicago")!),
        CityInfo(cityName: "Los Angeles", cityImage: UIImage(named: "Los Angeles")!),
        CityInfo(cityName: "New York", cityImage: UIImage(named: "New York")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        myTableView.register(CustomCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        view.backgroundColor = .cyan
        navigationController?.navigationBar.topItem?.title = "Cities"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}

//MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView:
                    UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityInfoViewController = CityInfoViewController()
        cityInfoViewController.cityName = places[indexPath.row].cityName
        cityInfoViewController.imageName = places[indexPath.row].cityImage
        navigationController?.pushViewController(cityInfoViewController, animated: false)
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomCell
        cell.cityLabel.text = places[indexPath.row].cityName
        cell.selectionStyle = .none
        return cell
    }
}
