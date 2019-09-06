//
//  CarRepairEmptyStateViewFactory.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

final class CarRepairEmptyStateViewFactory {
    static func makeForError() -> CarRepairEmptyStateView {
        let view = CarRepairEmptyStateView(message: "Something wrong happened. Please try again later.")
        view.addButton()

        return view
    }

    static func makeForEmptyState() -> CarRepairEmptyStateView {
        return CarRepairEmptyStateView(message: "There is no venues avaiable in your region.")
    }

    static func makeForLocationError() -> CarRepairEmptyStateView {
        let view = CarRepairEmptyStateView(message: "You need to change your location settings \nto get the best venues around you")
        view.addButton()

        return view
    }
}
