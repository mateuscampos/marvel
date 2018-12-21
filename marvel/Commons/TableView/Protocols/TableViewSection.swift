//
//  TableViewSection.swift
//  marvel
//
//  Created by Mateus Campos on 20/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

public protocol TableViewSection {
    
    var numberOfRows: Int { get }
    
    func registerCells(in tableView: UITableView)
    
    func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    
    func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath)
    
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView?
    func tableViewSectionFooter(_ tableView: UITableView) -> UIView?
    func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat
    func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat
    
}

public extension TableViewSection {
    
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
    func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
}
