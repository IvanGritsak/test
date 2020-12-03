//
//  ViewController.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {

    let nService = NetworkService()
        
    let mockData: [String] = (1...100).map { (i) in
        return "Row \(i)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nService.getBanners()
    }


}

