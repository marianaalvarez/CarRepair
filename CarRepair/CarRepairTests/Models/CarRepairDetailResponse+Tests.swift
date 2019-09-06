//
//  CarRepairDetailResponse+Tests.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

@testable import CarRepair

extension CarRepairDetailReponse {
    static func successMock() -> CarRepairDetailReponse {
        let data = MapperHelper.dataJSON(file: "detail_success")
        let response = try! JSONDecoder().decode(self, from: data)
        return response
    }
}

