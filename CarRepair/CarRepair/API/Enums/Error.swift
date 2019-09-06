//
//  StatusResponse.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

enum APIResponse: String {
    case success = "OK"
    case unknown = "UNKNOWN_ERROR"
    case zeroResults = "ZERO_RESULTS"
    case overQueryLimit = "OVER_QUERY_LIMIT"
    case requestDenied = "REQUEST_DENIED"
    case invalidRequest = "INVALID_REQUEST"
    case notFound = "NOT_FOUND"
}

enum NetworkError: String, Error {
    case parametersNil = "Parameters are nil."
    case encodingFailed = "Parameters enconding failed."
    case missingURL = "URL is nil."
}

enum NetworkResponse: String {
    case internetConnection = "Please, check your internet connection"
    case badRequest = "Bad request"
    case noData = "Response returned with no data to decode"
    case unableToDecode = "Response could not be decoded"
    case couldNotLoad = "Could not load data"
}

enum StatusCodeError: Int, Error {
    case timeout = 408
    case internalServerError = 500
}




