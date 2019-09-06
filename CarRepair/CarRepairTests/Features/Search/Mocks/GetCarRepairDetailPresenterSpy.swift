//
//  GetCarRepairDetailPresenterSpy.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

@testable import CarRepair

final class GetCarRepairDetailPresenterSpy: GetCarRepairDetailPresenter {
    var invokedShow = false
    var invokedShowParameters: (carRepair: CarRepairDetail, Void)?

    func show(carRepair: CarRepairDetail) {
        invokedShow = true
        invokedShowParameters = (carRepair, ())
    }

    var invokedShowError = false
    var invokedShowErrorParameters: (message: String, Void)?

    func showError(message: String) {
        invokedShowError = true
        invokedShowErrorParameters = (message, ())
    }
}
