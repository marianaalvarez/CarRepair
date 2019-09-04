//
//  CarRepairTableViewDataProvider.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import UIKit

final class CarRepairTableViewDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var carRepairList = [CarRepair]()

    override init() {}

    // MARK: Public functions

    func update(carRepairList: [CarRepair]) {
        self.carRepairList = carRepairList
    }

    // MARK: UITableViewDataSource conforms

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carRepairList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarRepairViewCell.reuseIdentifier) as? CarRepairViewCell {
            let item = carRepairList[indexPath.row]
            let viewModel = CarRepairViewModel(carRepair: item)
            cell.setup(viewModel: viewModel)

            return cell
        }
        return UITableViewCell()
    }

    // MARK: UITableViewDelegate conforms

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

