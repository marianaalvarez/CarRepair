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
        return mock(file: "places_success")
    }

    static func emptyMock() -> CarRepairReponse {
        return mock(file: "places_empty")
    }

    private static func mock(file: String) -> CarRepairReponse {
        let data = MapperHelper.dataJSON(file: file)
        let response = try! JSONDecoder().decode(self, from: data)
        return response
    }
}

