//
//  CarRepairEmptyStateView.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

protocol CarRepairErrorStateViewDelegate: class {
    func retry()
}

final class CarRepairEmptyStateView: UIView {
    private let errorMessage: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .darkGrey
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try again", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.blueWater, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(retry), for: .touchUpInside)
        button.isHidden = true

        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [errorMessage, retryButton])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    weak var delegate: CarRepairErrorStateViewDelegate?

    // MARK: Initializers

    init(message: String) {
        errorMessage.text = message

        super.init(frame: .zero)

        setupLayout()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Public functions

    func addButton() {
        retryButton.isHidden = false
    }

    // MARK: Private functions

    private func setupLayout() {
        addSubview(stackView, constraints: [
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        retryButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupView() {
        backgroundColor = .whiteSmoke
    }

    @objc private func retry() {
        delegate?.retry()
    }
}

