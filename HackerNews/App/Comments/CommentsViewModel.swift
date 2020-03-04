//
//  CommentsViewModel.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import RxSwift

protocol CommentsViewModel: ViewModel {
    func getCommentsModels() -> [CommentsModel]?
}

class CommentsViewModelImpl: BaseViewModel, CommentsViewModel {
    func getCommentsModels() -> [CommentsModel]? {
        return _commentsModels
    }
    
    let _commentsModels: [CommentsModel]?
    
    init(model: HackerNewsItemModel) {
        self._commentsModels = CommentsViewModelImpl.flattenComments(models: model.children, level: 0)
    }
    
    static func flattenComments(models: [HackerNewsItemModel]?, level: Int) -> [CommentsModel]? {
        var comments: [CommentsModel] = []
        if (models != nil) {
            models?.forEach { child in
                comments.append(CommentsModel(id: child.id, text: child.text ?? "", level: level))
                let subComments = flattenComments(models: child.children, level: level + 1)
                if let subComments = subComments {
                    comments += subComments
                }
            }
        }
        return comments
    }
    
    
}

