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
    var heroesResponse: HeroesResponse?
    var isLoading: Bool = false
    
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
        fetchHeroes(limit: 20, offset: 0)
    }
    
}

extension HeroesListViewController {
    
    func buildTableView(response: HeroesResponse) {
        
        self.heroes.append(contentsOf: response.heroes)

        var heroBuilders: [TableViewCellBuilder] = []
        
        var sections: [TableViewSection] = []
        
        for hero in heroes {
            let builder = ProfileViewCellBuilder(hero: hero)
            heroBuilders.append(builder)
        }
        
        let heroesSection = StaticSection(cellBuilders: heroBuilders)
        
        sections.append(heroesSection)
        
        if response.offset < response.total {
            
            let builder = LoadingViewCellBuilder()
            let loadingBuilders: [TableViewCellBuilder] = [builder]
            let loadingSection = StaticSection(cellBuilders: loadingBuilders)
            
            sections.append(loadingSection)
            
        }

        self.dataSourcce = TableViewDataSource(sections: sections,
                                               tableView: self.heroesListView.tableView)
        
        self.heroesListView.tableView.reloadData()
        
        self.dataSourcce?.loadMore = {
            self.loadMore()
        }
        
    }
    
    func fetchHeroes(limit: Int, offset: Int) {
        
        isLoading = true
        
        self.service.heroes(HeroesListRequest(limit: limit,
                                              offset: offset)) { response in
            
                                                switch response {
                                                case .success(let heroesResponse):
                                                    self.heroesResponse = heroesResponse
                                                    DispatchQueue.main.async {
                                                        self.loadingView.remove()
                                                        self.buildTableView(response: heroesResponse)
                                                        self.isLoading = false
                                                    }
                                                case .failure( let error) :
                                                    self.isLoading = false
                                                    print(error)
                                                }
            
        }
        
    }
    
    func loadMore() {
        
        guard let response = self.heroesResponse else {
            fetchHeroes(limit: 20, offset: 0)
            return
        }
        
        let offset = response.offset + response.limit
        
        if offset < response.total && !isLoading {
            fetchHeroes(limit: response.limit, offset: offset)
        }

    }
    
}
