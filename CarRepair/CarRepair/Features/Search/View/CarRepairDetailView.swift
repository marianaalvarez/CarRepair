//
//  CarRepairDetailView.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

final class CarRepairDetailView: UIView, GetCarRepairPhotoPresenter {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .imagePlaceholder

        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let starIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = .star

        return imageView
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var openingHourLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = viewModel.isOpen ? .vividGreen : .redTomato
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let pinIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = .pin

        return imageView
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGrey
        label.numberOfLines = 2
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let phoneIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = .phone

        return imageView
    }()

    private let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let webIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = .web

        return imageView
    }()

    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGrey
        label.numberOfLines = 1
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let viewModel: CarRepairDetailViewModel

    // MARK: Initializers

    init(viewModel: CarRepairDetailViewModel) {
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
        backgroundColor = .white
    }

    private func setupLabels() {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        phoneNumberLabel.text = viewModel.phoneNumber
        websiteLabel.text = viewModel.webSite
        ratingLabel.text = viewModel.rating
        openingHourLabel.text = viewModel.openNow
    }

    private func setupLayout() {

        addSubview(imageView, constraints: [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 160),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        addSubview(nameLabel, constraints: [
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        addSubview(starIcon, constraints: [
            starIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            starIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            starIcon.heightAnchor.constraint(equalToConstant: 12),
            starIcon.widthAnchor.constraint(equalToConstant: 12)
        ])

        addSubview(ratingLabel, constraints: [
            ratingLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 2),
            ratingLabel.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor)
        ])

        addSubview(openingHourLabel, constraints: [
            openingHourLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 6),
            openingHourLabel.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor)
        ])

        addSubview(pinIcon, constraints: [
            pinIcon.topAnchor.constraint(equalTo: openingHourLabel.bottomAnchor, constant: 24),
            pinIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pinIcon.heightAnchor.constraint(equalToConstant: 14),
            pinIcon.widthAnchor.constraint(equalToConstant: 14)
        ])

        addSubview(addressLabel, constraints: [
            addressLabel.leadingAnchor.constraint(equalTo: pinIcon.trailingAnchor, constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            addressLabel.topAnchor.constraint(equalTo: pinIcon.topAnchor, constant: -1)
        ])

        addSubview(phoneNumberLabel, constraints: [
            phoneNumberLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 16),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
        ])

        addSubview(phoneIcon, constraints: [
            phoneIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneIcon.heightAnchor.constraint(equalToConstant: 14),
            phoneIcon.widthAnchor.constraint(equalToConstant: 14),
            phoneIcon.centerYAnchor.constraint(equalTo: phoneNumberLabel.centerYAnchor)
        ])

        phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: 8).isActive = true

        addSubview(websiteLabel, constraints: [
            websiteLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 16),
            websiteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
        ])

        addSubview(webIcon, constraints: [
            webIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            webIcon.heightAnchor.constraint(equalToConstant: 16),
            webIcon.widthAnchor.constraint(equalToConstant: 16),
            webIcon.centerYAnchor.constraint(equalTo: websiteLabel.centerYAnchor)
        ])

        websiteLabel.leadingAnchor.constraint(equalTo: webIcon.trailingAnchor, constant: 8).isActive = true
    }

    // MARK: GetCarRepairPhotoPresenter conforms

    func show(photo: Data) {
        if let photoId = viewModel.photos?[0].photoReference {
            imageView.imageFrom(data: photo, photoId: photoId, placeHolder: UIImage())
        }
    }
    
    func show(cachedImage: UIImage) {
        imageView.image = cachedImage
    }
}

