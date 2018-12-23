//
//  StaticSection.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

class StaticSection: TableViewSection {
    
    private var cellBuilders: [TableViewCellBuilder]
    private var header: UIView?
    private var footer: UIView?
    
    public var numberOfRows: Int {
        return cellBuilders.count
    }
    
    public init(cellBuilders: [TableViewCellBuilder],
                header: UIView? = nil,
                footer: UIView? = nil) {
        
        self.header = header
        self.footer = footer
        self.cellBuilders = cellBuilders
    }
    
    public func registerCells(in tableView: UITableView) {
        for builder in cellBuilders {
            builder.registerCellIdentifier(in: tableView)
        }
    }
    
    public func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat {
        
        return cellBuilders[indexPath.row].cellHeight
        
    }
    
    public func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].tableViewShouldSelectCell(tableView)
    }
    
    public func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        return cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        return cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
        
    }
    
    public func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return footer
    }
    
    public func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return header
    }
    
    public func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat {
        if header != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
    public func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat {
        if footer != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
}
