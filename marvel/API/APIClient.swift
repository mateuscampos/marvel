//
//  APIClient.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public protocol APIClient {
    func dispatch(_ request: RequestData,
                  _ callback: @escaping (Result<APIResponse>) -> Void)
}


public extension APIClient {
    
    func requestDecodable<T: Decodable>(request: RequestData, callback: @escaping (Result<T>) -> Void) {
        
        dispatch(request) { resp in
            
            switch resp {
            case .success(let response):
                Parser.parse(from: response.data, callback: callback)
                
            case .failure(let error):
                callback(.failure(error))
            }
            
        }
        
    }
    
}
