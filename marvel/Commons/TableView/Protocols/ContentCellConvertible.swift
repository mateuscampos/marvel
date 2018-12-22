//
//  ContentCellConvertible.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public typealias ContentCellSize = CGFloat

public protocol ContentCellConvertible {
    associatedtype Configuration = Void
    
    static var cellHeight: ContentCellSize { get }
    static var cellInsets: UIEdgeInsets { get }
    
    init()
    
    func setup(with data: Configuration)
}

extension ContentCellConvertible where Configuration == Void {
    public func setup(with data: Configuration) {}
}

public extension ContentCellConvertible {
    
    public static var cellHeight: ContentCellSize {
        
        return UITableView.automaticDimension
        
    }
    
    public static var cellInsets: UIEdgeInsets {
        
        return .zero
        
    }
    
}
