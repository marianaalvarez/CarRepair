//
//  MapperHelper.swift
//  CarRepairTests
//
//  Created by mariana.alvarez on 9/6/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

final class MapperHelper {
    static func dataJSON(file: String) -> Data {
        let bundle = Bundle(for: MapperHelper.self)
        let path = bundle.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path)

        guard let data = try? Data(contentsOf: url, options: .alwaysMapped) else {
            assertionFailure("File could not be loaded")

            return Data()
        }

        return data
    }
}
