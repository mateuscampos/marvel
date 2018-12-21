//
//  HeroesListViewController.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation
import UIKit

class HeroesListViewController: UIViewController {
    
    let heroesListView: HeroesListView = HeroesListView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize view controller using view code")
    }
    
    override func loadView() {
        heroesListView.tableView.backgroundColor = .brown
        self.view = heroesListView
    }
    
}
