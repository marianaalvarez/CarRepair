//
//  GetCarRepairListPresenterSpy.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

@testable import CarRepair

final class GetCarRepairListPresenterSpy: GetCarRepairListPresenter {
    var invokedShowCarRepair = false
    var invokedShowCarRepairParameters: (list: [CarRepair], Void)?

    func showCarRepair(list: [CarRepair]) {
        invokedShowCarRepair = true
        invokedShowCarRepairParameters = (list, ())
    }
    var invokedShowError = false
    var invokedShowErrorParameters: (message: String, Void)?
    
    func showError(message: String) {
        invokedShowError = true
        invokedShowErrorParameters = (message, ())
    }

    var invokedShowEmptyState = false

    func showEmptyState() {
        invokedShowEmptyState = true
    }
}
