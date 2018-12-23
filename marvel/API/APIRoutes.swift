//
//  APIRoutes.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public enum APIRoutes {
    
    case characterList(limit: Int, offset: Int)

    
    public var path: String {
        
        return String("\(APIRoutes.baseUrl)\(relativePath)")
        
    }
    
    public var relativePath: String {
        
        switch self {
        case .characterList(let limit, let offset):
            return "characters?limit=\(limit)&offset=\(offset)"
        }
        
    }
    
    static var baseUrl: String {
        
        guard let baseUrl = EnvironmentSettings.baseUrl else {
            fatalError("Should have a base Url set up on project configuration")
        }
        
        return baseUrl
        
    }
    
}
