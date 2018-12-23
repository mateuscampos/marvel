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
        
        let path = APIRoutes.characterList(limit: request.limit,
                                           offset: request.offset).path
        
        let req = RequestData(path: path,
                              method: .get)
        
        self.api.heroes(req, callback)
        
    }
    
}
