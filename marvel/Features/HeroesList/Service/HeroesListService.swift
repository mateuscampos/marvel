//
//  HeroesListService.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public protocol HeroesListServiceProtocol {
    func heroes(_ request: HeroesListRequest,
                _ callback: @escaping (Result<HeroesResponse>) -> Void)
}

public class HeroesListService: HeroesListServiceProtocol {
    
    let api: HeroesListAPIProtocol
    
    public init(api: HeroesListAPIProtocol = HeroesListAPI()) {
        self.api = api
    }
    
    public func heroes(_ request: HeroesListRequest,
                       _ callback: @escaping (Result<HeroesResponse>) -> Void) {
        
        let req = RequestData(path: "https://gateway.marvel.com:443/v1/public/characters?limit=20&offset=19&apikey=e241b9f6294563c7eef34a6699f964a7",
                              method: .get)
        
        self.api.heroes(req, callback)
        
    }
    
}
