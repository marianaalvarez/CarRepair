//
//  CarRepairAPI.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

protocol CarRepairAPIProtocol {
    func getCarRepairList(location: [String], callback: @escaping (Result<CarRepairReponse>) -> Void)
    func getCarRepairPhoto(id: String, callback: @escaping (Result<Data>) -> Void)
    func getCarRepairDetail(id: String, callback: @escaping (Result<CarRepairDetailReponse>) -> Void)
}

final class CarRepairAPI: CarRepairAPIProtocol {
    let service: Router<CarRepairService>

    init(service: Router<CarRepairService> = Router<CarRepairService>()) {
        self.service = service
    }

    func getCarRepairList(location: [String], callback: @escaping (Result<CarRepairReponse>) -> Void) {
        service.request(route: .getCarRepairList(location: location)) { result in
                DispatchQueue.main.async {
                    callback(result)
                }
            }
    }

    func getCarRepairPhoto(id: String, callback: @escaping (Result<Data>) -> Void) {
        service.request(route: .getPhoto(id: id)) { result in
            DispatchQueue.main.async {
                callback(result)
            }
        }
    }

    func getCarRepairDetail(id: String, callback: @escaping (Result<CarRepairDetailReponse>) -> Void) {
        service.request(route: .getCarRepairDetail(id: id)) { result in
            DispatchQueue.main.async {
                callback(result)
            }
        }
    }
}
