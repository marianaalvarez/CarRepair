//
//  EndPointType.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: [String: Any]? { get }
    var parameters: [String: Any] { get }
}
