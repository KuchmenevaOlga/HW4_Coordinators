//
//  TabBarController.swift
//  Navigation
//
//  Created by Ольга Кучменева on 28.02.2021.
//  Copyright © 2021 Olga Kuchmeneva. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let loginCoordinator = MainCoordinator(navigationController:
                                            UINavigationController())
    let feedCoordinator = FeedCoordinator(navigationController: UINavigationController())
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginCoordinator.start()
        feedCoordinator.start()
           
    viewControllers = [feedCoordinator.navigationController,
                       loginCoordinator.navigationController]
    }
}

