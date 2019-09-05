//
//  UIImage+Cache.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {

    func imageFrom(data: Data, photoId: String, placeHolder: UIImage) {
        if let downloadedImage = UIImage(data: data) {
            imageCache.setObject(downloadedImage, forKey: NSString(string: photoId))
            image = downloadedImage
        } else {
            image = placeHolder
        }
    }
}
