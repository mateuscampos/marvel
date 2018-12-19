//
//  Result.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

public enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func map<Z>(_ transformer: (T) -> Z) -> Result<Z> {
        
        switch self {
            
        case .success(let value):
            return .success(transformer(value))
            
        case .failure(let error):
            return .failure(error)
            
        }
        
    }
    
}
