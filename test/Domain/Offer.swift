//
//  Offer.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import Foundation

struct Offer: Codable {
    var id: String
    var name: String
    var desc: String?
    var groupName: String
    var image: String
    var type: String
    var price: Int?
    var discount: Float?
}
