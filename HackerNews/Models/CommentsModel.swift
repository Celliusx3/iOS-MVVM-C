//
//  CommentsModel.swift
//  HackerNews
//
//  Created by Oh Coyan on 01/03/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation

struct CommentsModel {
    let id: Int
    let text: String
    let level: Int
    
    init (id: Int, text: String, level: Int) {
        self.id = id
        self.text = text
        self.level = level
    }
}
