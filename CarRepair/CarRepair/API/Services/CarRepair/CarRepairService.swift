//
//  CarRepairAPI.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

enum CarRepairService {
    case getCarRepairList(location: [String])
    case getPhoto(id: String)
    case getCarRepairDetail(id: String)
}

extension CarRepairService: EndPointType {

    var baseURL: URL {
        guard let url = URL(string: Environment.baseURL) else {
            fatalError("Could not found base URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .getCarRepairList:
            return "nearbysearch/json"
        case .getPhoto(_):
            return "photo"
        case .getCarRepairDetail(_):
            return "details/json"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getCarRepairList:
            return .requestParameters(urlParameters: parameters, headers: nil)
        case .getPhoto(_):
            return .requestParameters(urlParameters: parameters, headers: nil)
        case .getCarRepairDetail(_):
            return .requestParameters(urlParameters: parameters, headers: nil)
        }
    }

    var headers: [String : Any]? {
        return nil
    }

    public var parameters: [String : Any] {
        switch self {
        case .getCarRepairList(let location):
            return [
                "location": (location as NSArray).componentsJoined(by: ","),
                "radius": 5000,
                "type": "car_repair"
            ]
        case .getPhoto(let id):
            return [
                "maxwidth": 400,
                "photoreference": id
            ]
        case .getCarRepairDetail(let id):
            return [
                "placeid": id
            ]
        }
    }
}
