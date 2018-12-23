//
//  RequestData.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get
}

public struct RequestData {
    
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: [String: String]?
    
    public init (
        path: String,
        method: HTTPMethod = .get,
        params: [String: Any?]? = nil,
        headers: [String: String]? = nil
        ) {
        
        let credentials = DefautPathParameters().credentials(ts: Date().timeIntervalSince1970.description)
        self.path = String("\(path)\(credentials)")
        self.method = method
        self.params = params
        self.headers = headers
        
    }
    
}

