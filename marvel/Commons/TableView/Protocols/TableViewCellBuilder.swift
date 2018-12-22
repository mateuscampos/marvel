//
//  TableViewCellBuilder.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public protocol TableViewCellBuilder {
    
    var cellHeight: CGFloat { get }
    
    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
    
}

public extension TableViewCellBuilder {
    
    func tableViewDidSelectCell(_ tableView: UITableView) {
        
    }
    
}
