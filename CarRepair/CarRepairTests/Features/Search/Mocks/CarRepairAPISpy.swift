//
//  CarRepairAPISpy.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

@testable import CarRepair

final class CarRepairAPISpy: CarRepairAPIProtocol {
    var invokedGetCarRepairList = false
    var invokedGetCarRepairListParameters: (location: [String], Void)?
    var stubbedGetCarRepairListCallbackResult: Result<CarRepairReponse>?

    func getCarRepairList(location: [String], callback: @escaping (Result<CarRepairReponse>) -> Void) {
        invokedGetCarRepairList = true
        invokedGetCarRepairListParameters = (location, ())
        if let result = stubbedGetCarRepairListCallbackResult {
            callback(result)
        }
    }

    var invokedGetCarRepairPhoto = false
    var invokedGetCarRepairPhotoParameters: (id: String, Void)?
    var stubbedGetCarRepairPhotoCallbackResult: (Result<Data>)?

    func getCarRepairPhoto(id: String, callback: @escaping (Result<Data>) -> Void) {
        invokedGetCarRepairPhoto = true
        invokedGetCarRepairPhotoParameters = (id, ())
        if let result = stubbedGetCarRepairPhotoCallbackResult {
            callback(result)
        }
    }

    var invokedGetCarRepairDetail = false
    var invokedGetCarRepairDetailParameters: (id: String, Void)?
    var stubbedGetCarRepairDetailCallbackResult: (Result<CarRepairDetailReponse>)?

    func getCarRepairDetail(id: String, callback: @escaping (Result<CarRepairDetailReponse>) -> Void) {
        invokedGetCarRepairDetail = true
        invokedGetCarRepairDetailParameters = (id, ())
        if let result = stubbedGetCarRepairDetailCallbackResult {
            callback(result)
        }
    }
}
