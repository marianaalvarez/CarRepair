//
//  GetCarRepairListPresenter.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

protocol GetCarRepairListPresenter: class {
    func showCarRepair(list: [CarRepair])
    func showError(message: String)
}
