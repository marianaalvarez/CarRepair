//
//  Router.swift
//  CarRepair
//
//  Created by mariana.alvarez on 9/3/19.
//  Copyright © 2019 mariana.alvarez. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    private let session = URLSession.shared

    func request<T>(route: EndPoint, callback: @escaping (Result<T>) -> Void) where T : Decodable, T : Encodable {
        request(route: route) { responseData in

            switch responseData {
            case.success(let data):
                do {
                    let apiResponse = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(apiResponse))
                } catch {
                    callback(.failure(NetworkResponse.unableToDecode.rawValue))
                }
            case .failure(let message):
                callback(.failure(message))
            }
        }
    }

    func request(route: EndPoint, callback: @escaping (Result<Data>) -> Void) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                if error != nil {
                    DispatchQueue.main.async {
                        callback(.failure(NetworkResponse.couldNotLoad.rawValue))
                    }
                    return
                }

                DispatchQueue.main.async {
                    if let data = data {
                        callback(.success(data))
                    } else {
                        callback(.failure(NetworkResponse.internetConnection.rawValue))
                    }
                }
            })
        } catch {
            callback(.failure(NetworkResponse.internetConnection.rawValue))
        }
        self.task?.resume()
    }

    

    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10)

        request.httpMethod = route.httpMethod.rawValue

        do {
            switch route.task {
            case .requestParameters(let urlParameters, _):
                try configureParameters(urlParameters: urlParameters, request: &request)
            }
            return request
        }
        catch {
            throw error
        }

    }

    fileprivate func configureParameters(urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }

    fileprivate func addAditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Void> {
        switch response.statusCode {
        case 200:
            return .success(())
        case StatusCodeError.internalServerError.rawValue:
            return .failure("Erro interno no servidor")
        case StatusCodeError.timeout.rawValue:
            return .failure("Timeout")
        default:
            return .failure("Ocorreu um erro. Tente novammente mais tarde.")
        }
    }

}
