//
//  CarRepair.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

struct CarRepair: Codable {
    let id: String
    let name: String
    let rating: Double
    let address: String
    let isOpen: Bool?
    let photos: [Photo]?

    enum RootKeys: String, CodingKey {
        case name, rating
        case id = "place_id"
        case address = "vicinity"
        case openingHours = "opening_hours"
        case photos = "photos"
    }

    enum OpeningHoursKeys: String, CodingKey {
        case isOpen = "open_now"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        rating = try container.decode(Double.self, forKey: .rating)
        address = try container.decode(String.self, forKey: .address)
        photos = try? container.decode([Photo].self, forKey: .photos)
        let openingHours = try? container.nestedContainer(keyedBy: OpeningHoursKeys.self, forKey: .openingHours)
        isOpen = try openingHours?.decode(Bool.self, forKey: .isOpen)
    }
}
