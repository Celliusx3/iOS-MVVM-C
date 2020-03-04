//
//  DetailsCoordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 28/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import UIKit

class DetailsCoordinator: BaseCoordinator {
    
    private let detailsViewModel: DetailsViewModel
    private let hackerNewsItemModel: HackerNewsItemModel
    
    init(detailsViewModel: DetailsViewModel, hackerNewsItemModel: HackerNewsItemModel) {
        self.detailsViewModel = detailsViewModel
        self.hackerNewsItemModel = hackerNewsItemModel
    }
    
    override func start() {
        self.removeChildCoordinators()
        let tabBarController = DetailsViewController.instantiate()

        let commentsCoordinator = AppDelegate.container.resolve(CommentsCoordinator.self, argument:hackerNewsItemModel)!
        commentsCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 0)
        commentsCoordinator.navigationController.tabBarItem.title = "Comments"

        
//        nc1.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 0)


        commentsCoordinator.start()
        let articlesCoordinator = AppDelegate.container.resolve(ArticlesCoordinator.self, argument:hackerNewsItemModel.url)!
        articlesCoordinator.start()
        articlesCoordinator.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 0)
        articlesCoordinator.navigationController.tabBarItem.title = "Articles"
        tabBarController.setViewControllers([commentsCoordinator.navigationController, articlesCoordinator.navigationController], animated: true)
        
        self.navigationController.viewControllers += [tabBarController]
        
//        let viewController = DetailsViewController.instantiate()
//        self.navigationController.viewControllers = [viewController]
    }
}

