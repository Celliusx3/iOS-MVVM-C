//
//  BaseViewModel.swift
//  HackerNews
//
//  Created by Oh Coyan on 28/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import RxSwift

//protocol ViewModel {
//    var viewEvent: ViewEvent { get }
//    var viewData: ViewData { get }
//    var output: Output { get }
//    var input: Input { get }
//}
//
//protocol ViewEvent {}
//protocol ViewData {}
//protocol Output {}
//protocol Input {}

protocol ViewModel {
    func getLoading()-> Observable<Bool>
}

class BaseViewModel: ViewModel {
    let loading = PublishSubject<Bool>()
    
    func getLoading() -> Observable<Bool> {
        return loading
    }
}
