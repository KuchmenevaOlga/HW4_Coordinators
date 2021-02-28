//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Ольга Кучменева on 25.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
 
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LogInViewController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        navigationController.pushViewController(vc, animated: false)
    }
    

    func openProfile() {
        let child = ProfileCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()

    }
    
    func openVerification() {
        let vc = LogInViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
