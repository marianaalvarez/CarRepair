//
//  CarRepairDetailViewControllerFactory.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

final class CarRepairDetaiViewlControllerFactory {
    static func make(with id: String) -> CarRepairDetailViewController {
        return CarRepairDetailViewController(placeId: id, carRepairAPI: CarRepairAPI())
    }
}
