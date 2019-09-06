//
//  RepairCarResponse.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

@testable import CarRepair

extension CarRepairReponse {
    static func successMock() -> CarRepairReponse {
        let data = MapperHelper.dataJSON(file: "places_success")
        let response = try! JSONDecoder().decode(self, from: data)
        return response
    }
}

