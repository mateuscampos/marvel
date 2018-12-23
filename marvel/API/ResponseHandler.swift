//
//  ResponseHandler.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public struct ResponseHandler {
    
    public func handle(data: Data?,
                       response: URLResponse?,
                       error: Error?,
                       callback: @escaping (Result<APIResponse>) -> Void) {
        
        if let error = error {
            callback(.failure(error))
        }
        
        guard let _data = data else {
            callback(.failure(ConnError.noData))
            return
        }
        
        guard let _response = response as? HTTPURLResponse else {
            callback(.failure(ConnError.noStatusCode))
            return
        }
        
        switch _response.statusCode {
        case 200...299:
            
            callback(.success(APIResponse(data: _data,
                                          response: _response)))
            
        default:
            
            callback(.failure(ConnError.genericConnError))
            
        }
        
        
        
    }
    
}
