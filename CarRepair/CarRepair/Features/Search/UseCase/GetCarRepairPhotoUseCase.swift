//
//  GetCarRepairPhotoUseCase.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

final class GetCarRepairPhotoUseCase: Interactor {
    private let presenter: GetCarRepairPhotoPresenter
    private let carRepairAPI: CarRepairAPIProtocol
    private let photo: Photo?

    // MARK: Initializer

    init(photo: Photo?, presenter: GetCarRepairPhotoPresenter, carRepairAPI: CarRepairAPIProtocol) {
        self.presenter = presenter
        self.carRepairAPI = carRepairAPI
        self.photo = photo
    }

    // MARK: Interactor conforms

    func run() {
        if let photo = photo {
            if let cachedImage = imageCache.object(forKey: NSString(string: photo.photoReference)) {
                self.presenter.show(cachedImage: cachedImage)
                return
            }

            carRepairAPI.getCarRepairPhoto(id: photo.photoReference) { result in
                switch result {
                case .success(let response):
                    self.presenter.show(photo: response)
                case .failure(_):
                    self.presenter.showEmptyState()
                }
            }
        }
    }
}
