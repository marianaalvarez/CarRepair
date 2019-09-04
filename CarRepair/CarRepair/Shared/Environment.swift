//
//  Environment.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/4/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

struct Environment {
    static var baseURL: String {
        guard let url = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            fatalError("BASE_URL not found on Info.plist file")
        }
        return url
    }

    static var apiKey: String {
        guard let url = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("API_KEY not found on Info.plist file")
        }
        return url
    }
}
