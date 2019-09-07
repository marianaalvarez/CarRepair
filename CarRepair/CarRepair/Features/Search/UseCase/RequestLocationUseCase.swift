//
//  RequestLocationUseCase.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation
import CoreLocation

final class RequestLocationUseCase: Interactor {
    private unowned let presenter: CLLocationManagerDelegate & RequestLocationErrorPresenter
    private let locationManager: CLLocationManager

    init(locationManager: CLLocationManager, presenter: CLLocationManagerDelegate & RequestLocationErrorPresenter) {
        self.locationManager = locationManager
        self.presenter = presenter
    }

    func run() {
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.requestLocation()
            default:
                presenter.showLocationError()
            }
        }
    }
}
