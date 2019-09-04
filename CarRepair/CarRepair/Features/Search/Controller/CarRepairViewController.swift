//
//  CarRepairViewController.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/2/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

class CarRepairViewController: UIViewController, GetCarRepairListPresenter {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CarRepairViewCell.self, forCellReuseIdentifier: CarRepairViewCell.reuseIdentifier)
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.accessibilityIdentifier = "car_repair_table_view"

        return tableView
    }()

    private let errorStateView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

    private lazy var getCarRepairListUseCase: Interactor = {
        return GetCarRepairListUseCase(presenter: self, carRepairAPI: carRepairAPI)
    }()

    private lazy var dataProvider = CarRepairTableViewDataProvider()

    private var carRepairAPI: CarRepairAPIProtocol

    // MARK: Initializer

    init(carRepairAPI: CarRepairAPIProtocol) {
        self.carRepairAPI = carRepairAPI

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
        setupDelegate()
        getCarRepair()
    }

    // MARK: Private functions

    private func setupView() {
        title = "Car Repair"
        view.backgroundColor = .white
    }

    private func setupDelegate() {
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
    }

    private func getCarRepair() {
        showLoading()
        getCarRepairListUseCase.run()
    }

    private func setupLayout() {
        errorStateView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(equalConstraintsFor: tableView)
        view.addSubview(equalConstraintsFor: errorStateView)

        view.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func showLoading() {
        activityIndicator.startAnimating()
        tableView.isHidden = true
        errorStateView.isHidden = true
    }

    private func removeLoading() {
        activityIndicator.stopAnimating()
    }

    // MARK: GetCarRepairListPresenter conforms

    func showCarRepair(list: [CarRepair]) {
        dataProvider.update(carRepairList: list)
        tableView.reloadData()

        removeLoading()
        tableView.isHidden = false
        errorStateView.isHidden = true
    }

    func showError(message: String) {
        removeLoading()
        tableView.isHidden = true
        errorStateView.isHidden = false
    }
}

