//
//  WhitespaceTableViewCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public final class WhitespaceTableViewCellBuilder: TableViewCellBuilder {
    
    init(spacing: CGFloat) {
        self.cellHeight = spacing
    }
    
    public var cellHeight: CGFloat
    
    public func registerCellIdentifier(in tableView: UITableView) {
        
        tableView.register(ContainerTableViewCell.self)
        
    }
    
    public func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        
        let cell: ContainerTableViewCell = tableView.dequeue(indexPath: indexPath)
        return cell
        
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        
        return false
        
    }
    
}
