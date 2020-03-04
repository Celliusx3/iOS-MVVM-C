//
//  HackerNewsItemModel.swift
//  HackerNews
//
//  Created by Oh Coyan on 26/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

struct HackerNewsItemModel {
    let id: Int
    let created_at: String?
    let created_at_i: Int64?
    let type: String?
    let author: String?
    let title: String?
    let url: String?
    let text: String?
    let points: Int?
    let parent_id: Int?
    let story_id: Int?
    let children: [HackerNewsItemModel]?
    let viewType: ViewType
    
    init (id: Int) {
        self.id = id
        self.created_at = nil
        self.created_at_i = nil
        self.type = nil
        self.author = nil
        self.title = nil
        self.url = nil
        self.text = nil
        self.points = nil
        self.parent_id = nil
        self.story_id = nil
        self.children = nil
        self.viewType = ViewType.empty
    }
    
    init (model: HackerNewsItem) {
        self.id = model.id
        self.created_at = model.created_at
        self.created_at_i = model.created_at_i
        self.type = model.type
        self.author = model.author
        self.title = model.title
        self.url = model.url
        self.text = model.text
        self.points = model.points
        self.parent_id = model.parent_id
        self.story_id = model.story_id
        self.children = model.children?.map {
            child in HackerNewsItemModel(model: child)
        }
        self.viewType = ViewType.full
    }
}

enum ViewType: Int {
    case empty = 0
    case full = 1
}
