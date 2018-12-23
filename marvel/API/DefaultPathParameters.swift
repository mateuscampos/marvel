//
//  DefaultPathParameters.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public struct DefautPathParameters {
    
    let keys: MarvelKeysProtocol
    
    init(keys: MarvelKeysProtocol = MarvelKeys()) {
        self.keys = keys
    }
    
    public func credentials(ts: String) -> String {
        let toHash = String("\(ts)\(keys.marvelPrivateKey)\(keys.marvelPublicKey)")
        let hash = toHash.MD5
        return String("&ts=\(ts.description)&apikey=\(keys.marvelPublicKey)&hash=\(hash)")
    }
    
}
