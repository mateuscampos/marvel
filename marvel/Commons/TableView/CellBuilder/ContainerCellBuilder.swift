//
//  ContainerCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public final class ContainerCellBuilder<T: UIView & ContentCellConvertible> {
    public typealias Configuration = T.Configuration
    
    var configuration: T.Configuration
    
    private var configureCell: ((ContainerTableViewCell) -> Void)?
    private var onSelect: (() -> Void)?
    
    public init(_ configuration: T.Configuration,
                configureCell: ((ContainerTableViewCell) -> Void)? = nil,
                onSelect: (() -> Void)? = nil) {
        
        self.configuration = configuration
        self.configureCell = configureCell
        self.onSelect = onSelect
        
    }
    
}

extension ContainerCellBuilder where T.Configuration == Void {
    
    public convenience init(configureCell: ((ContainerTableViewCell) -> Void)? = nil,
                            onSelect: (() -> Void)? = nil) {
        
        self.init((), configureCell: configureCell, onSelect: onSelect)
        
    }
    
}

extension ContainerCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        
        return T.cellHeight
        
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        
        tableView.register(ContainerTableViewCell.self)
        
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: ContainerTableViewCell =
            tableView.dequeue(indexPath: indexPath)
        
        let view = T.init()
        
        view.setup(with: configuration)
        
        cell.addContent(view, insets: T.cellInsets)
        
        configureCell?(cell)
        
        return cell
        
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        
        return onSelect != nil
        
    }
    
    public func tableViewDidSelectCell(_ tableView: UITableView) {
        
        onSelect?()
        
    }
    
}
