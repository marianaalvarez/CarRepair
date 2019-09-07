//
//  CarRepairViewControllerFactory.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import CoreLocation

final class CarRepairViewControllerFactory {
    static func make() -> CarRepairViewController {
        return CarRepairViewController(locationManager: CLLocationManager(), carRepairAPI: CarRepairAPI())
    }
}
