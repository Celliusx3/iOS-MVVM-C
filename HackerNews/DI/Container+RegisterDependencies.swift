//
//  Container+RegisterDependencies.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//
import Swinject

extension Container {
    func registerDependencies() {
        self.registerServices()
        self.registerCoordinators()
        self.registerViewModels()
    }
}
