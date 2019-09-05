//
//  GetCarRepairDetailUseCase.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

final class GetCarRepairDetailUseCase: Interactor {
    private unowned let presenter: GetCarRepairDetailPresenter
    private let carRepairAPI: CarRepairAPIProtocol
    private let placeId: String

    init(placeId: String, carRepairAPI: CarRepairAPIProtocol, presenter: GetCarRepairDetailPresenter) {
        self.placeId = placeId
        self.carRepairAPI = carRepairAPI
        self.presenter = presenter
    }

    func run() {
        carRepairAPI.getCarRepairDetail(id: placeId) { result in
            switch result {
            case .success(let response):
                self.presenter.show(carRepair: response.carRepair)
            case .failure(let message):
                self.presenter.showError(message: message)
            }
        }
    }
}

