//
//  CarRepairViewController.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/2/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit
import CoreLocation

class CarRepairViewController: UIViewController, GetCarRepairListPresenter, CarRepairDataProviderDelegate,
CLLocationManagerDelegate, RequestLocationErrorPresenter {

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .whiteSmoke
        collectionView.bounces = false
        collectionView.accessibilityIdentifier = "car_repair_table_view"

        return collectionView
    }()

    private let errorStateView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

    private var getCarRepairListUseCase: GetCarRepairListUseCase?

    private lazy var dataProvider = CarRepairTableViewDataProvider(collectionView: collectionView, delegate: self)

    private var carRepairAPI: CarRepairAPIProtocol

    private lazy var useCase = RequestLocationUseCase(presenter: self)

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
        errorStateView.isHidden = true
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupUseCase()
    }

    // MARK: Private functions

    private func setupView() {
        title = "Car Repair"
        view.backgroundColor = .whiteSmoke
    }

    private func setupUseCase() {
        useCase.run()
    }

    private func getCarRepair(location: [String]) {
        showLoading()
        getCarRepairListUseCase = GetCarRepairListUseCase(location: location, presenter: self, carRepairAPI: carRepairAPI)
        getCarRepairListUseCase?.run()
    }

    private func setupLayout() {
        errorStateView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(equalConstraintsFor: collectionView)
        view.addSubview(equalConstraintsFor: errorStateView)

        view.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func showLoading() {
        activityIndicator.startAnimating()
        collectionView.isHidden = true
        errorStateView.isHidden = true
    }

    private func removeLoading() {
        activityIndicator.stopAnimating()
    }

    // MARK: GetCarRepairListPresenter conforms

    func showCarRepair(list: [CarRepair]) {
        dataProvider.update(carRepairList: list)
        collectionView.reloadData()

        removeLoading()
        collectionView.isHidden = false
        errorStateView.isHidden = true
    }

    func showError(message: String) {
        removeLoading()
        collectionView.isHidden = true
        errorStateView.isHidden = false
    }

    // MARK: Conforms to CarRepairDataProviderDelegate

    func show(carRepair: CarRepair) {
        let viewController = CarRepairDetaiViewlControllerFactory.make(with: carRepair.id)
        self.navigationController?.show(viewController, sender: nil)
    }

    // MARK: RequestLocationErrorPresenter conforms

    func showLocationError() {
        print("Location error")
    }

    // MARK: CLLocationManagerDelegate conforms

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
            showLocationError()
            return
        }

        let location = [String(locValue.latitude), String(locValue.longitude)]
        getCarRepair(location: location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showLocationError()
    }
}

