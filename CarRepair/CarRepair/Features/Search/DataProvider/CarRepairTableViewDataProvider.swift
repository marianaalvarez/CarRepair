//
//  CarRepairTableViewDataProvider.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

final class CarRepairTableViewDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private var carRepairList = [CarRepair]()
    private let collectionView: UICollectionView

    private lazy var cellSize: CGSize = {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 160)
    }()

    private lazy var cellEdgeInsets: UIEdgeInsets = {
        let horizontalInset = (collectionView.frame.width - cellSize.width) * 0.5

        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }()


    // MARK: Initializer

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView

        super.init()

        registerCell()
        setupDelegate()
    }

    // MARK: Private functions

    private func registerCell() {
        collectionView.register(CarRepairViewCell.self, forCellWithReuseIdentifier: CarRepairViewCell.reuseIdentifier)
    }

    private func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: Public functions

    func update(carRepairList: [CarRepair]) {
        self.carRepairList = carRepairList
    }

    // MARK: UICollectionViewDataSource conforms

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarRepairViewCell.reuseIdentifier, for: indexPath) as? CarRepairViewCell else {
            return UICollectionViewCell()
        }

        let item = carRepairList[indexPath.row]
        let viewModel = CarRepairViewModel(carRepair: item)
        cell.setup(viewModel: viewModel)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carRepairList.count
    }

    // MARK: UICollectionViewDelegateFlowLayout conforms

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout, layout.itemSize == .zero {
            layout.itemSize = cellSize
        }

        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout, layout.sectionInset == .zero {
            layout.sectionInset = cellEdgeInsets
        }

        return cellEdgeInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

