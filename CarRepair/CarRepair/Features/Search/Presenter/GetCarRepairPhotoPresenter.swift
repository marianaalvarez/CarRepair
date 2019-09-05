//
//  GetCarRepairPhotoPresenter.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation
import UIKit

protocol GetCarRepairPhotoPresenter: class {
    func show(photo: Data)
    func showEmptyState()
    func show(cachedImage: UIImage)
}
