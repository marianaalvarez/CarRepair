//
//  CarRepairAPI.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

protocol CarRepairAPIProtocol {
    func getCarRepairList(callback: @escaping (Result<CarRepairReponse>) -> Void)
}

final class CarRepairAPI: CarRepairAPIProtocol {
    let service: Router<CarRepairService>

    init(service: Router<CarRepairService> = Router<CarRepairService>()) {
        self.service = service
    }

    func getCarRepairList(callback: @escaping (Result<CarRepairReponse>) -> Void) {
        service.request(route: .getCarRepairList) { result in
                DispatchQueue.main.async {
                    callback(result)
                }
            }
    }
}
