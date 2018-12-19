//
//  Parser.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public enum ParserError: Swift.Error {
    case invalidModel
}

public enum Parser {
    
    static func parse<T: Decodable>(dataType: T.Type = T.self, from data: Data) throws -> T {
        return try JSONDecoder().decode(dataType, from: data)
    }
    
    static func parse<T: Decodable>(dataType: T.Type = T.self,
                                    from data: Data,
                                    callback: (Result<T>) -> Void) {
        
        do {
            
            let object = try parse(dataType: dataType, from: data)
            callback(.success(object))
            
        } catch {
            
            #if DEBUG
            print("Error decoding model: \(error)")
            if let str = String(data: data, encoding: .utf8) {
                print("Data: \(str)")
            }
            #endif
            
            callback(.failure(ParserError.invalidModel))
            
        }
        
    }
    
}
