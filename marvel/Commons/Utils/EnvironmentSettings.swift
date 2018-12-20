//
//  EnvironmentSettings.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public enum EnvironmentSettings {
    
    public static var environment: [String: AnyObject]? {
        return Bundle.main.infoDictionary?["EnvironmentSettings"] as? [String: AnyObject]
    }
    
    public static var baseUrl: String? {
        return environment?["BASE_URL"] as? String
    }
    
}
