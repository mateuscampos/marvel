//
//  HeroDetailViewController.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation
import UIKit

class HeroDetailViewController: UIViewController {
    
    private let hero: Hero
    let heroDetailView: HeroDetailView = HeroDetailView()
    var dataSourcce: TableViewDataSource?
    
    init(hero: Hero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize view controller using view code")
    }
    
    override func loadView() {
        super.loadView()
        self.view = heroDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
    }

}

extension HeroDetailViewController {
    
    func createTable() {

        var sections: [TableViewSection] = []
        sections.append(createProfileSection())
        
        // TODO: Create comics section
        // TODO: Create events section
        // TODO: Create stories section
        // TODO: Create series section
        
        self.dataSourcce = TableViewDataSource(
            sections: sections,
            tableView: self.heroDetailView.tableView)
        
        self.heroDetailView.tableView.reloadData()
        
    }
    
    func createProfileSection() -> TableViewSection {
        
        let whiteSpacingBuilder = WhitespaceTableViewCellBuilder(
            spacing: 32)
        
        let nameCellBuilder = SingleTextCellBuilder(
            SingleTextCell.Configuration(
                font: UIFont(
                    name: "system",
                    size: 18),
                text: hero.name))
        
        let imageCellBuilder = SingleImagePresentationCellBuilder(
            SingleImagePresentationCell.Configuration(
                imagePath: hero.thumbnail.fullPath()))
        
        var description = "Sorry, no descriptions found"
        if let desc = hero.description {
            
            if desc.count > 0 {
                description = desc
            }

        }
        
        let descriptionCellBuilder = SingleTextCellBuilder(
            SingleTextCell.Configuration(
                font: UIFont(
                    name: "system",
                    size: 16),
                text: description))
        
        return StaticSection(
            cellBuilders: [whiteSpacingBuilder,
                           nameCellBuilder,
                           imageCellBuilder,
                           descriptionCellBuilder])
        
    }
    
}
