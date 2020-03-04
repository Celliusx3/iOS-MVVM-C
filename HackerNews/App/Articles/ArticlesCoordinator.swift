//
//  ArticlesCoordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

class ArticlesCoordinator: BaseCoordinator {
    
    private let url: String?
    
    init(url: String?) {
        self.url = url
    }
    
    override func start() {
        let viewController = ArticlesViewController.instantiate()
        viewController.url = self.url
        self.navigationController.isNavigationBarHidden = true
        self.navigationController.viewControllers = [viewController]
    }
}
