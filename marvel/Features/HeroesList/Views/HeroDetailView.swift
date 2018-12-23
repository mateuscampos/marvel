//
//  HeroDetailView.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation
import UIKit

public class HeroDetailView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeroDetailView: ViewCodingProtocol {
    
    func configureViews() {
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    func buildViewHierarchy() {
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        tableView.constraint { view in
            
            [view.topAnchor.constraint(equalTo: self.topAnchor),
             view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             view.leftAnchor.constraint(equalTo: self.leftAnchor),
             view.rightAnchor.constraint(equalTo: self.rightAnchor)]
            
        }
        
    }
    
}
