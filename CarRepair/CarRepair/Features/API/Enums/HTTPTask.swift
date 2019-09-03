//
//  HTTPTask.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case requestParameters(urlParameters: Parameters?, headers: HTTPHeaders?)
}
