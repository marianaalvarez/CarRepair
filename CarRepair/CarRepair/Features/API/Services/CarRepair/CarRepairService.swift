//
//  CarRepairAPI.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

enum CarRepairService {
    case getCarRepairList
}

extension CarRepairService: EndPointType {

    var environmentBaseURL: String {
        return "https://maps.googleapis.com/maps/api/place"
    }

    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("Could not found base URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .getCarRepairList:
            return "/nearbysearch"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getCarRepairList:
            return .requestParameters(urlParameters: nil, headers: nil)
        }
    }

    var headers: [String : Any]? {
        return nil
    }
}

