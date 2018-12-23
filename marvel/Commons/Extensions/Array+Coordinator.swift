//
//  Array+Coordinator.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

extension Array where Element == Coordinator {
    
    mutating func remove<T: Coordinator>(coordinator: T.Type) {
        
        if let i = self.index(where: {$0 is T}) {
            remove(at: i)
        }
        
    }
    
    mutating func remove<T: Coordinator>(_ coordinator: T) {
        
        if let i = self.index(where: { $0 === coordinator }) {
            remove(at: i)
        }
        
    }
    
}
