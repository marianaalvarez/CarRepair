//
//  GetCarRepairListUseCase.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

final class GetCarRepairListUseCase: Interactor {
    private unowned let presenter: GetCarRepairListPresenter
    private let carRepairAPI: CarRepairAPIProtocol
    private let location: [String]

    init(location: [String], presenter: GetCarRepairListPresenter, carRepairAPI: CarRepairAPIProtocol) {
        self.location = location
        self.presenter = presenter
        self.carRepairAPI = carRepairAPI
    }

    func run() {
        carRepairAPI.getCarRepairList(location: location) { result in
            switch result {
            case .success(let response):
                if response.carRepairList.isEmpty {
                    self.presenter.showEmptyState()
                } else {
                    self.presenter.showCarRepair(list: response.carRepairList)
                }
            case .failure(let message):
                self.presenter.showError(message: message)

            }
        }
    }
}
