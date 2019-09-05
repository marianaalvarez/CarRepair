//
//  CarRepairDetailResponse.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

struct CarRepairDetailReponse: Codable {
    let carRepair: CarRepairDetail
    let status: String

    enum CodingKeys: String, CodingKey {
        case carRepair = "results"
        case status
    }
}
