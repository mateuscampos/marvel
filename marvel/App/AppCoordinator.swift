//
//  AppCoordinator.swift
//  marvel
//
//  Created by Mateus Campos on 19/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private var navigation: UINavigationController
    private var childCoordinators: [Coordinator] = []
    
    init(rootViewController: UINavigationController) {
        
        navigation = rootViewController
        
    }
    
    func start() {
        
        let coordinator = HeroesListCoordinator(rootViewController: self.navigation)
        coordinator.start()
        self.childCoordinators.append(coordinator)
        
    }
    
    func mockFakeViewController() -> UIViewController {
        
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        return viewController
        
    }
    
    func printHeroes() {
        
        HeroesListService().heroes(HeroesListRequest(limit: 20, offset: 20)) { list in
            print(list)
        }
        
    }
    
}
