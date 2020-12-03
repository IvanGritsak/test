//
//  NetworkService.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import Foundation
import UIKit

class NetworkService {
    let kBaseURL = "https://s3.eu-central-1.amazonaws.com/sl.files/"
    let session = URLSession.shared
    
    func getBanners(completion: @escaping (_ banners: [(Banner, UIImage)],_ err: Error?) -> Void) {
        session.dataTask(with: URL(string: kBaseURL + "banners.json")!) {data, res, err in
            
            var jsonBanners: [Banner] = []
            var banners: [(Banner, UIImage)] = []
            let group = DispatchGroup()
            
            if let err = err {
                print("ERROR: \(err)")
                completion([], err)
            }
            
            guard let json = data else {
                print("ERROR: no data provided")
                completion([], err)
                return
            }
            
            do {
                jsonBanners = try JSONDecoder().decode([Banner].self, from: json)
            } catch let error {
                print("ERROR: \(error)")
                completion([], error)
                return
            }
                        
            for banner in jsonBanners {
                DispatchQueue.global(qos: .userInitiated).async(group: group) {
                    if let url = URL(string: banner.image) {
                        do {
                            let data = try Data(contentsOf: url)
                            let image = UIImage(data: data)!
                            banners.append((banner, image))
                        } catch let err {
                            print("ERROR: \(err)")
                        }
                    }
                }
            }
            
            group.notify(queue: .main) {
                completion(banners, nil)
            }
            
            
        }.resume()
    }
    
    func getOffers(completion: @escaping (_ offers: [(Offer, UIImage)],_ err: Error?) -> Void) {
        session.dataTask(with: URL(string: kBaseURL + "offers.json")!) {data, res, err in
            
            var jsonOffers: [Offer] = []
            var offers: [(Offer, UIImage)] = []
            let group = DispatchGroup()

            
            if let err = err {
                print("ERROR: \(err)")
            }
            
            guard let json = data else {
                print("ERROR: no data provided")
                return
            }
            
            do {
                jsonOffers = try JSONDecoder().decode([Offer].self, from: json)
            } catch let error {
                print("ERROR: \(error)")
                completion([], error)
                return
            }
                        
            for offer in jsonOffers {
                DispatchQueue.global(qos: .userInitiated).async(group: group) {
                    if let url = URL(string: offer.image) {
                        do {
                            let data = try Data(contentsOf: url)
                            let image = UIImage(data: data)!
                            offers.append((offer, image))
                        } catch let err {
                            print("ERROR: \(err)")
                        }
                    }
                }
            }
            
            group.notify(queue: .main) {
                completion(offers, nil)
            }
            
            
        }.resume()
    }
        
}
