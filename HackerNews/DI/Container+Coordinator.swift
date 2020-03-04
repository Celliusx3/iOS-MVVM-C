//
//  Container+Coordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        self.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        self.autoregister(MainCoordinator.self, initializer: MainCoordinator.init)
        self.register(DetailsCoordinator.self) { r, model in
            DetailsCoordinator(detailsViewModel: r.resolve(DetailsViewModel.self)!, hackerNewsItemModel: model)
        }
        self.register(CommentsCoordinator.self) { (r: Resolver, model: HackerNewsItemModel) in
            CommentsCoordinator(commentsViewModel: r.resolve(CommentsViewModel.self, argument: model)!)
        }
        self.register(ArticlesCoordinator.self) { r, url in
            ArticlesCoordinator(url: url)
        }
        
//        self.register(CommentsCoordinator.self) { r, model in
//            CommentsCoordinator(commentsViewModel: r.resolve(CommentsViewModel.self, argument: model)!)
//        }
        
        
//        self.autoregister(DetailsCoordinator.self, initializer: DetailsCoordinator.init)
    }
}
