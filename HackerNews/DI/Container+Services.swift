//
//  Container+Services.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Swinject

extension Container {
    
    func registerServices() {
        self.autoregister(HackerNewsService.self, initializer: HackerNewsServiceImpl.init).inObjectScope(.container)
//        self.autoregister(DataManager.self, initializer: UserDataManager.init).inObjectScope(.container)
//        self.autoregister(BackendRestClient.self, initializer: BackendRestClient.init).inObjectScope(.container)
//        self.autoregister(AlertDispatcher.self, initializer: AlertDispatcher.init).inObjectScope(.container)
//        self.autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
//        self.autoregister(TranslationsService.self, initializer: TranslationsService.init).inObjectScope(.container)
//        self.autoregister(HttpClient.self, initializer: HttpClientMock.init).inObjectScope(.container)
    }
}
