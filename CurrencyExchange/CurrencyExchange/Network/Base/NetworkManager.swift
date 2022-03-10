//
//  NetworkManager.swift
//  CurrencyExchange
//
//  Created by Farbod Rahiminik on 3/10/22.
//

import Foundation
import Alamofire
import Network

public protocol NetworkServiceProtocol: AnyObject {
    
    func execute<T:Codable> (_ urlRequest: URLRequestBuilder,
                             model: T.Type,
                             completion: @escaping (Result<T,AFError>) -> Void)
    
}

public extension NetworkServiceProtocol {
    
    func execute<T:Codable> (_ urlRequest: URLRequestBuilder,
                             model: T.Type,
                             completion: @escaping ((Result<T,AFError>) -> Void)) {
        AF.request(urlRequest).responseDecodable(of: T.self) { result in
            if let value = result.value {
                completion(Result.success(value))
            }else if let error = result.error {
                completion(Result.failure(error))
            }
        }
    }
    
    
    
    
}

public class NetworkService: NetworkServiceProtocol {
    
    public static let `default`: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()
}
