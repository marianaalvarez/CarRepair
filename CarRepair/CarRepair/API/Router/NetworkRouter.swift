//
//  NetworkRouter.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request<T>(route: EndPoint, callback: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable
    func request(route: EndPoint, callback: @escaping (Result<Data>) -> Void)
}

