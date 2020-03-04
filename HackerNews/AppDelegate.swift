//
//  AppDelegate.swift
//  HackerNews
//
//  Created by Oh Coyan on 23/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//
import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    static let container = Container()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Container.loggingFunction = nil
        AppDelegate.container.registerDependencies()
                
        self.appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        self.appCoordinator.start()

        return true
    }
}
