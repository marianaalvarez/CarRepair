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

    init(presenter: GetCarRepairListPresenter, carRepairAPI: CarRepairAPIProtocol) {
        self.presenter = presenter
        self.carRepairAPI = carRepairAPI
    }

    func run() {
        carRepairAPI.getCarRepairList { result in
            switch result {
            case .success(let response):
                self.presenter.showCarRepair(list: response.carRepairList)
            case .failure(let message):
                self.presenter.showError(message: message)

            }
        }
    }
}
