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
        
        let controller = HeroesListViewController()
        controller.title = "Heroes"
        self.navigation.viewControllers = [controller]
        
    }
    
}
