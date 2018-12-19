//
//  HeroesResponse.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public struct HeroesResponse: Codable {
    
    public var offset: Int
    public var limit: Int
    public var total: Int
    public var count: Int
    public var heroes: [Hero]
    
    public enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case heroes = "results"
    }
    
}

public struct Hero: Codable {
    
    public var id: Int
    public var name: String
    public var description: String
    public var modified: Date
    public var thumbnail: Thumbnail
    
}

public struct Thumbnail: Codable {
    
    public var path: String
    
}
