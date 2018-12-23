//
//  HeroesListCoordinator.swift
//  marvel
//
//  Created by Mateus Campos on 21/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation
import UIKit

class HeroesListCoordinator: Coordinator {
    
    private var navigation: UINavigationController
    private var childCoordinators: [Coordinator] = []
    
    init(rootViewController: UINavigationController) {

        navigation = rootViewController
        
    }
    
    func start() {
        
        let controller = HeroesListViewController(delegate: self)
        controller.title = "Heroes"
        self.navigation.viewControllers = [controller]
        
    }
    
    func showDetail(hero: Hero) {
        
        let controller = HeroDetailViewController(hero: hero)
        controller.title = "Hero detail"
        self.navigation.pushViewController(controller,
                                           animated: true)
        
    }
    
}

extension HeroesListCoordinator: HeroesListViewControllerDelegate {
    
    func heroesListViewControllerDidSelectedHero(_ viewController: HeroesListViewController,
                                                 hero: Hero) {
        
        showDetail(hero: hero)
        
    }
    
}
