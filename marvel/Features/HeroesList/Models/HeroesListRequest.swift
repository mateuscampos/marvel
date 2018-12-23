//
//  HeroesListRequest.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public struct HeroesListRequest: Codable {
    
    public var limit: Int
    public var offset: Int
    
}
