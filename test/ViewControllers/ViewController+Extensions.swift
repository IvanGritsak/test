//
//  ViewController+Extensions.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 3 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return offers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = mainTableViewOutlet.dequeueReusableCell(withIdentifier: "bannersTableViewCellID")!
            return cell
        default:
            let cell = mainTableViewOutlet.dequeueReusableCell(withIdentifier: "offerTableViewCellID") as! OfferTableViewCell
            cell.setupCell(offers[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { true }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            return
        default:
            return
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 196
        default:
            return 128
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "Aкции"
        case 2:
            return "Скидки"
        default:
            return nil
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainSearchBarOutlet.endEditing(true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let indexPath = IndexPath(row: 0, section: 1)
        mainTableViewOutlet.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let indexPath = IndexPath(row: 0, section: 0)
        mainTableViewOutlet.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat.leastNormalMagnitude
        default:
            return 30
        }
    }
    
}

