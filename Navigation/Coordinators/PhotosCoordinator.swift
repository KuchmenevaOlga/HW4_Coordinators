//
//  PhotosCoordinator.swift
//  Navigation
//
//  Created by Ольга Кучменева on 28.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//
import UIKit

class PhotosCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
 
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PhotosViewController()

        navigationController.pushViewController(vc, animated: true)
    }
}
