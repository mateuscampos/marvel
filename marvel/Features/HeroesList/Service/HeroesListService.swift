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
        
        guard let baseUrl = EnvironmentSettings.baseUrl else {
            fatalError("Should have a base url set up on project configuration")
        }
        
        let req = RequestData(path: "\(baseUrl)characters?limit=20&offset=19",
                              method: .get)
        
        self.api.heroes(req, callback)
        
    }
    
}
