//
//  CarRepairDetailViewController.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/5/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

final class CarRepairDetailViewController: UIViewController, GetCarRepairDetailPresenter {
    private var carRepairDetailView: CarRepairDetailView?
    private let errorStateView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

    private lazy var getCarRepairDetailUseCase: Interactor = {
        return GetCarRepairDetailUseCase(placeId: placeId, carRepairAPI: carRepairAPI, presenter: self)
    }()

    private let carRepairAPI: CarRepairAPIProtocol
    private let placeId: String

    // MARK: Initializer

    init(placeId: String, carRepairAPI: CarRepairAPIProtocol) {
        self.carRepairAPI = carRepairAPI
        self.placeId = placeId

        super.init(nibName: nil, bundle: nil)
    }

    // MARK: NSCoding conforms

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        super.loadView()

        setupLayout()
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getCarRepairDetail()
    }

    // MARK: Private functions

    private func setupView() {
        title = "Car Repair Detail"
        view.backgroundColor = .white
    }

    private func getCarRepairDetail() {
        showLoading()
        getCarRepairDetailUseCase.run()
    }

    private func setupLayout() {
        errorStateView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(equalConstraintsFor: errorStateView)

        view.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func setupDetailViewLayout() {
        if let detailView = carRepairDetailView {
            detailView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(detailView, constraints: [
                detailView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }

    private func showLoading() {
        activityIndicator.startAnimating()
        errorStateView.isHidden = true
    }

    private func removeLoading() {
        activityIndicator.stopAnimating()
    }

    // MARK: GetCarRepairDetailPresenter conforms

    func show(carRepair: CarRepairDetail) {
        let viewModel = CarRepairDetailViewModel(carRepair: carRepair)
        carRepairDetailView = CarRepairDetailViewFactory.make(with: viewModel)
        setupDetailViewLayout()
        removeLoading()
        carRepairDetailView?.isHidden = false
        errorStateView.isHidden = true
    }

    func showError(message: String) {
        removeLoading()
        carRepairDetailView?.isHidden = true
        errorStateView.isHidden = false
    }
}
