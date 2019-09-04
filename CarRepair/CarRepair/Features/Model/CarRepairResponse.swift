//
//  CarRepairResponse.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

struct CarRepairReponse: Codable {
    let carRepairList: [CarRepair]
    let status: String
    let nextPageToken: String

    enum CodingKeys: String, CodingKey {
        case status
        case nextPageToken = "next_page_token"
        case carRepairList = "results"
    }
}
