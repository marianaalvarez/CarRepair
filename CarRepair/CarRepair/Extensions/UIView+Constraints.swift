//
//  UIView+Constraints.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview<T: UIView>(_ view: T, constraints: [NSLayoutConstraint]) {
        addSubview(view)

        NSLayoutConstraint.activate(constraints)
    }

    func addSubview<T: UIView>(equalConstraintsFor view: T) {
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
