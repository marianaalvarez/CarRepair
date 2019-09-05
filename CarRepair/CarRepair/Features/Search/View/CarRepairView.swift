//
//  CarRepairView.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

final class CarRepairView: UIView, GetCarRepairPhotoPresenter {
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.1
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let starIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill

        return imageView
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let openingHourLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .redTomato
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let viewModel: CarRepairViewModel

    // MARK: Initializers

    init(viewModel: CarRepairViewModel) {
        self.viewModel = viewModel

        super.init(frame: .zero)

        setupLayout()
        setupView()
        setupLabels()
    }

    // MARK: NSCoding conforms
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Private functions

    private func setupView() {
        backgroundColor = .clear
    }

    private func setupLabels() {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        ratingLabel.text = viewModel.rating
        openingHourLabel.text = viewModel.openNow
    }

    private func setupLayout() {
        addSubview(equalConstraintsFor: contentView)

        contentView.addSubview(imageView, constraints: [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        contentView.addSubview(nameLabel, constraints: [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        contentView.addSubview(addressLabel, constraints: [
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        contentView.addSubview(addressLabel, constraints: [
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        contentView.addSubview(starIcon, constraints: [
            starIcon.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 4),
            starIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])

        contentView.addSubview(ratingLabel, constraints: [
            ratingLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 2),
            ratingLabel.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor)
        ])

        contentView.addSubview(openingHourLabel, constraints: [
            openingHourLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 6),
            openingHourLabel.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor)
        ])
    }

    // MARK: GetCarRepairPhotoPresenter conforms

    func show(photo: Data) {
        if let photoId = viewModel.photos?[0].photoReference {
            imageView.imageFrom(data: photo, photoId: photoId, placeHolder: UIImage())
        }
    }

    func showEmptyState() {

    }

    func show(cachedImage: UIImage) {
        imageView.image = cachedImage
    }
}
