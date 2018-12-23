//
//  DataModelResponse.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public struct DataModelResponse<T: Codable>: Codable {
    public var data: T
}
