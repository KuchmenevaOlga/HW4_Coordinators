//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Ольга Кучменева on 28.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
 
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileViewController()
        vc.coordinator = self
        vc.timeForTimer = 0
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    func openPhotos() {
        
        let child = PhotosCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
}
