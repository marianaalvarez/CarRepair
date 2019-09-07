//
//  CarRepairViewController.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/2/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit
import CoreLocation

final class CarRepairViewController: UIViewController, GetCarRepairListPresenter, CarRepairDataProviderDelegate,
CLLocationManagerDelegate, RequestLocationErrorPresenter, CarRepairErrorStateViewDelegate {
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .whiteSmoke
        collectionView.bounces = false
        collectionView.accessibilityIdentifier = "car_repair_table_view"

        return collectionView
    }()

    private let errorStateView: CarRepairEmptyStateView = {
        let view = CarRepairEmptyStateViewFactory.makeForError()
        view.accessibilityIdentifier = "car_repair_error"
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let emptyStateView: CarRepairEmptyStateView = {
        let view = CarRepairEmptyStateViewFactory.makeForEmptyState()
        view.accessibilityIdentifier = "car_repair_empty_state"
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view

    }()

    private let locationErrorView: CarRepairEmptyStateView = {
        let view = CarRepairEmptyStateViewFactory.makeForLocationError()
        view.accessibilityIdentifier = "car_repair_location_error"
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)

    private lazy var dataProvider = CarRepairTableViewDataProvider(collectionView: collectionView, delegate: self)
    private lazy var requestLocationUseCase = RequestLocationUseCase(presenter: self)

    private var getCarRepairListUseCase: GetCarRepairListUseCase?
    private var carRepairAPI: CarRepairAPIProtocol

    private var viewsToHideOnLoading: [UIView] {
        return [errorStateView, emptyStateView, locationErrorView, collectionView]
    }

    private var viewsToHideOnShow: [UIView] {
        return [errorStateView, emptyStateView, locationErrorView]
    }

    private var viewsToHideOnError: [UIView] {
        return [collectionView, emptyStateView, locationErrorView]
    }

    private var viewsToHideOnEmptyState: [UIView] {
        return [collectionView, errorStateView, locationErrorView]
    }

    private var viewsToHideOnLocationError: [UIView] {
        return [collectionView, errorStateView, emptyStateView]
    }

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
        setupDelegates()
        requestLocation()
    }

    // MARK: Private functions

    private func setupView() {
        title = "Car Repair"
        view.backgroundColor = .whiteSmoke
    }

    private func setupDelegates() {
        errorStateView.delegate = self
        locationErrorView.delegate = self
    }

    private func requestLocation() {
        showLoading()
        requestLocationUseCase.run()
    }

    private func getCarRepair(location: [String]) {
        showLoading()
        getCarRepairListUseCase = GetCarRepairListUseCase(location: location, presenter: self, carRepairAPI: carRepairAPI)
        getCarRepairListUseCase?.run()
    }

    private func setupLayout() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(equalConstraintsFor: collectionView)
        view.addSubview(equalConstraintsFor: errorStateView)
        view.addSubview(equalConstraintsFor: emptyStateView)
        view.addSubview(equalConstraintsFor: locationErrorView)

        view.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func showLoading() {
        activityIndicator.startAnimating()
        hide(views: viewsToHideOnLoading)
    }

    private func removeLoading() {
        activityIndicator.stopAnimating()
    }
    private func hide(views: [UIView]) {
        views.first(where: { view in !view.isHidden})?.isHidden = true
    }

    // MARK: GetCarRepairListPresenter conforms

    func showCarRepair(list: [CarRepair]) {
        dataProvider.update(carRepairList: list)
        collectionView.reloadData()

        removeLoading()
        collectionView.isHidden = false
        hide(views: viewsToHideOnShow)
    }

    func showEmptyState() {
        removeLoading()
        emptyStateView.isHidden = false
        hide(views: viewsToHideOnEmptyState)
    }

    func showError(message: String) {
        removeLoading()
        errorStateView.isHidden = false
        hide(views: viewsToHideOnError)
    }

    // MARK: Conforms to CarRepairDataProviderDelegate

    func show(carRepair: CarRepair) {
        let viewController = CarRepairDetaiViewlControllerFactory.make(with: carRepair.id)
        self.navigationController?.show(viewController, sender: nil)
    }

    // MARK: RequestLocationErrorPresenter conforms

    func showLocationError() {
        removeLoading()
        locationErrorView.isHidden = false
        hide(views: viewsToHideOnLocationError)
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

    // MARK: PlaylistErrorStateViewDelegate conforms

    func retry() {
        requestLocation()
    }
}

