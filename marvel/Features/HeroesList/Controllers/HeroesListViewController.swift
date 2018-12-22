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
    
    let loadingView = LoadingView()
    let heroesListView: HeroesListView = HeroesListView()
    var dataSourcce: TableViewDataSource?
    var heroes: [Hero] = []
    let service: HeroesListServiceProtocol
    
    init(service: HeroesListServiceProtocol = HeroesListService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize view controller using view code")
    }
    
    override func loadView() {
        self.view = heroesListView
        self.loadingView.showIn(view: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroes(limit: 20, offset: 20)
    }
    
}

extension HeroesListViewController {
    
    func buildTableView(response: HeroesResponse) {
        
        self.heroes.append(contentsOf: response.heroes)

        var builders: [TableViewCellBuilder] = []
        
        for hero in heroes {
            let builder = ProfileViewCellBuilder(hero: hero)
            builders.append(builder)
        }
        
        let heroesSection = StaticSection(cellBuilders: builders)
        
        self.dataSourcce = TableViewDataSource(sections: [heroesSection],
                                               tableView: self.heroesListView.tableView)
        
        self.heroesListView.tableView.reloadData()
        
    }
    
    func fetchHeroes(limit: Int, offset: Int) {
        
        self.service.heroes(HeroesListRequest(limit: limit,
                                              offset: offset)) { response in
            
                                                switch response {
                                                case .success(let heroesResponse):
                                                    DispatchQueue.main.async {
                                                        self.loadingView.remove()
                                                        self.buildTableView(response: heroesResponse)
                                                    }
                                                case .failure( let error) :
                                                    print(error)
                                                }
            
        }
        
    }
    
}
