//
//  ViewController.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -UI-
    @IBOutlet weak var mainTableViewOutlet: UITableView!
    @IBOutlet weak var mainSearchBarOutlet: UISearchBar!
    @IBOutlet weak var activityIndicatorOutlet: UIActivityIndicatorView!
    var offers:[(Offer, UIImage)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainTableViewOutlet.isHidden = true
        activityIndicatorOutlet.startAnimating()
        // Do any additional setup after loading the view.
        mainSearchBarOutlet.delegate = self
        fetchOffers()
    }
    
    
    func fetchOffers() {
        NetworkService().getOffers { [weak self] (offers, err) in
            guard let `self` = self else {return}
            if let err = err {
                print("\(err.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.offers = offers
                self.mainTableViewOutlet.isHidden = false
                self.activityIndicatorOutlet.stopAnimating()
                self.mainTableViewOutlet.reloadData()
            }
        }
    }
}

