//
//  AppCoordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator {

    private let disposeBag = DisposeBag()
    private var window = UIWindow(frame: UIScreen.main.bounds)
        
    override func start() {
        self.window.makeKeyAndVisible()
        self.showDashboard()
    }
    
    
    
    private func showDashboard() {
        self.removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(MainCoordinator.self)!
        self.start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(
            window: self.window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }
}
