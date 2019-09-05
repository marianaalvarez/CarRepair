//
//  CarRepairViewCell.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation
import UIKit

final class CarRepairViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CarRepairViewCell"
    private var carRepairView: CarRepairView!

    // MARK: Initializers

    override func prepareForReuse() {
        super.prepareForReuse()

        carRepairView.removeFromSuperview()
    }

    // MARK: Initializers

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Public functions

    func setup(viewModel: CarRepairViewModel) {
        carRepairView = CarRepairViewFactory.make(with: viewModel)

        carRepairView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(carRepairView, constraints: [
            carRepairView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            carRepairView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            carRepairView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            carRepairView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // MARK: Private functions

    private func setupView() {
        backgroundColor = .clear
    }
}

