//
//  CommentsCoordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

class CommentsCoordinator: BaseCoordinator {
    private let commentsViewModel: CommentsViewModel
    
    init(commentsViewModel: CommentsViewModel) {
        self.commentsViewModel = commentsViewModel
    }
    
    override func start() {
        let viewController = CommentsViewController.instantiate()
        viewController.commentsViewModel = self.commentsViewModel
        self.navigationController.isNavigationBarHidden = true
        self.navigationController.viewControllers = [viewController]
    }
}
