//
//  CarRepairViewModel.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

struct CarRepairViewModel {
    let name: String
    let rating: String
    let address: String
    let isOpen: Bool
    var openNow: String
    let photos: [Photo]?

    init(carRepair: CarRepair) {
        self.name = carRepair.name ?? ""
        self.rating = "\(carRepair.rating ?? 0)"
        self.address = carRepair.address ?? "No address informed"
        self.isOpen = carRepair.isOpen ?? false
        self.openNow = ""
        self.photos = carRepair.photos

        setupOpeningHour(isOpen: carRepair.isOpen)
    }

    mutating func setupOpeningHour(isOpen: Bool?) {
        guard let isOpen = isOpen else {
            return
        }

        if isOpen {
            openNow = "- Open now"
        } else {
            openNow = "- Closed now"
        }
    }
}

