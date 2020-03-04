//
//  MainViewModel.swift
//  HackerNews
//
//  Created by Oh Coyan on 27/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import RxSwift

protocol MainViewModel: ViewModel {
    func startScreen()
    func callTopStoryDetailsAPI(id: Int)
    func getTopStoryIds() -> Observable<[Int]>
    func getTopStoryDetails() -> Observable<[HackerNewsItemModel]>
    
    func onTopStorySelected(model: Int)
    func navigateToDetails() -> Observable<HackerNewsItemModel>
}

class MainViewModelImpl: BaseViewModel, MainViewModel{
    let hackerNewsService: HackerNewsService
    
    let topStoryIds = PublishSubject<[Int]>()
    let topStoryDetails = PublishSubject<[HackerNewsItemModel]>()
    let navToDetails = PublishSubject<HackerNewsItemModel>()
    
    private var currentTopStoriesDetails:[HackerNewsItemModel] = []

    init(hackerNewsService: HackerNewsService) {
        self.hackerNewsService = hackerNewsService
    }
    
    func onTopStorySelected(model: Int) {
        self.navToDetails.onNext(currentTopStoriesDetails[model])
    }
    
    func navigateToDetails() -> Observable<HackerNewsItemModel> {
        return navToDetails
    }
       
    func callTopStoryDetailsAPI(id: Int) {
        self.hackerNewsService.getHackerNewsItem(id: id) {(result) in
            do {
                let ids = try result.get()
                let test = self.currentTopStoriesDetails.map { notGood -> HackerNewsItemModel in
                    if (notGood.id == ids.id) {
                        return HackerNewsItemModel(model:ids)
                    }
                    return notGood
                }
                self.topStoryDetails.onNext(test)
            } catch {}
        }
    }
    
    func startScreen() {
        loading.onNext(true)
        self.hackerNewsService.getTopStories(pageSize: 25) {(result) in
            self.loading.onNext(false)
            do {
                let ids = try result.get().map {
                    gg in HackerNewsItemModel(id: gg)
                }
                self.topStoryDetails.onNext(ids)
            } catch {            }
        }
    }
    
    func getTopStoryDetails() -> Observable<[HackerNewsItemModel]> {
        return topStoryDetails.do(onNext: {
            gg in self.currentTopStoriesDetails = gg
        })
    }
    
    func getTopStoryIds() -> Observable<[Int]> {
        return topStoryIds
    }
}
