//
//  HeroesListAPI.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public protocol HeroesListAPIProtocol {
    
    func heroes(_ params: RequestData,
                _ callback: @escaping (Result<HeroesResponse>) -> Void)
    
}

public class HeroesListAPI: HeroesListAPIProtocol {
    
    private typealias ResultType = Result<DataModelResponse<HeroesResponse>>
    
    let api: APIClient
    
    public init(api: APIClient = MarvelApiClient.instance) {
        
        self.api = api
        
    }
    
    public func heroes(_ params: RequestData,
                       _ callback: @escaping (Result<HeroesResponse>) -> Void) {
        
        self.api.requestDecodable(request: params) {(result: ResultType) in
            callback(result.map { $0.data })
        }
        
    }

}
