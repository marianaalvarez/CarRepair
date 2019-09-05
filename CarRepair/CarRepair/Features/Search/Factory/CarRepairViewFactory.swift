//
//  CarRepairViewFactory.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

final class CarRepairViewFactory {
    static func make(with viewModel: CarRepairViewModel) -> CarRepairView {
        let view = CarRepairView(viewModel: viewModel)
        let useCase = GetCarRepairPhotoUseCase(photo: viewModel.photos?[0], presenter: view, carRepairAPI: CarRepairAPI())
        useCase.run()

        return view
    }
}
