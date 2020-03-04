//
//  MainCoordinator.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

import RxSwift
import UIKit

class MainCoordinator: BaseCoordinator {
    private let mainViewModel: MainViewModel
    private let disposeBag = DisposeBag()
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }
    
    override func start() {
        self.mainViewModel.navigateToDetails()
          .subscribe(onNext: { [weak self] model in self?.showDetails(model: model) })
          .disposed(by: self.disposeBag)
        
        let viewController = MainViewController.instantiate()
        viewController.mainViewModel = mainViewModel
        
        self.navigationController.viewControllers = [viewController]
    }
    
    private func showDetails(model: HackerNewsItemModel) {
        self.removeChildCoordinators()
        let coordinator = AppDelegate.container.resolve(DetailsCoordinator.self, argument:model)!
                
        coordinator.navigationController = self.navigationController
        
        self.start(coordinator: coordinator)
    }
}
