//
//  MarvelApiClient.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public enum ConnError: Swift.Error {
    case invalidURL
    case noData
    case noStatusCode
    case genericConnError
}

public struct MarvelApiClient: APIClient {
    
    public static let instance = MarvelApiClient()
    private init() {}
    
    public func dispatch(_ request: RequestData,
                         _ callback: @escaping (Result<APIResponse>) -> Void) {
        
        guard let url = URL(string: request.path) else {
            callback(.failure(ConnError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        do {
            if let params = request.params {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        } catch let error {
            callback(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            ResponseHandler().handle(data: data,
                                     response: response,
                                     error: error,
                                     callback: callback)

            }.resume()
        
    }
    
}
