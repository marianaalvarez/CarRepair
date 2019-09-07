//
//  CarRepairDetailViewModel.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

struct CarRepairDetailViewModel {
    let name: String
    let rating: String
    let address: String
    let isOpen: Bool
    let phoneNumber: String
    let webSite: String
    var openNow: String
    let photos: [Photo]?

    init(carRepair: CarRepairDetail) {
        self.name = carRepair.name ?? ""
        let rating = carRepair.rating ?? 0
        self.rating = "\(rating)"
        self.address = carRepair.address ?? "No address informed"
        self.phoneNumber = carRepair.phoneNumber ?? "(XX) XXXXX-XXXXX"
        self.webSite = carRepair.website ?? ""
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
