//
//  HackerNewsItem.swift
//  HackerNews
//
//  Created by Oh Coyan on 23/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

struct HackerNewsItem: Codable {
    let id: Int
    let created_at: String
    let created_at_i: Int64
    let type: String
    let author: String?
    let title: String?
    let url: String?
    let text: String?
    let points: Int?
    let parent_id: Int?
    let story_id: Int?
    let children: [HackerNewsItem]?
}
