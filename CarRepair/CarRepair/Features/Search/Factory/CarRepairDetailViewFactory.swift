//
//  CarRepairDetailViewFactory.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

final class CarRepairDetailViewFactory {
    static func make(with viewModel: CarRepairDetailViewModel) -> CarRepairDetailView {
        let view = CarRepairDetailView(viewModel: viewModel)
        let useCase = GetCarRepairPhotoUseCase(photo: viewModel.photos?[0], presenter: view, carRepairAPI: CarRepairAPI())
        useCase.run()

        return view
    }
}
