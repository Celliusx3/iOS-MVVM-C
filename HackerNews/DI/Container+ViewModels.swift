//
//  Container+ViewModels.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import Swinject

extension Container {
    func registerViewModels() {
        self.autoregister(MainViewModel.self, initializer: MainViewModelImpl.init)
        self.autoregister(DetailsViewModel.self, initializer:DetailsViewModel.init)
        self.register(CommentsViewModel.self) { r, model in
            CommentsViewModelImpl(model: model)
        }
//        self.autoregister(DrawerMenuViewModel.self, initializer: DrawerMenuViewModel.init)
//        self.autoregister(DashboardViewModel.self, initializer: DashboardViewModel.init)
//        self.autoregister(SettingsViewModel.self, initializer: SettingsViewModel.init)
//        
//        self.autoregister(SetNameViewModel.self, initializer: SetNameViewModel.init)
//        self.autoregister(SetOptionsViewModel.self, initializer: SetOptionsViewModel.init)
    }
}
