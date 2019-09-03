//
//  ParameterEncoding.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
