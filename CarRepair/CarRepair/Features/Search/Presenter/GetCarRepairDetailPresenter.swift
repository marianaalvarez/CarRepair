//
//  GetCarRepairDetailPresenter.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

protocol GetCarRepairDetailPresenter: class {
    func show(carRepair: CarRepairDetail)
    func showError(message: String)
}
