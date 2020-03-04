//
//  HackerNewsService.swift
//  HackerNews
//
//  Created by Oh Coyan on 23/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import Foundation
import Alamofire

protocol HackerNewsService {
    func getTopStories(pageSize: Int, completion: @escaping (Result<[Int], AFError>) -> Void)
    func getHackerNewsItem(id : Int, completion: @escaping (Result<HackerNewsItem, AFError>) -> Void)
}

struct HackerNewsServiceImpl: HackerNewsService {

    func getTopStories(pageSize: Int, completion: @escaping (Result<[Int], AFError>) -> Void) {
        let url = "\(ApiRoutes.hackerTopStoriesUrl)/\(ApiRoutes.topStories)"
        let parameters: Parameters = [
            "orderBy": "\"$key\"",
            "limitToFirst": "\(pageSize)"
        ]
        AF.request(url, method: .get, parameters: parameters)
        .validate()
        .responseDecodable { (response: DataResponse<[Int], AFError>) in
            completion(response.result)
        }
    }
    
    func getHackerNewsItem(id: Int, completion: @escaping (Result<HackerNewsItem, AFError>) -> Void) {
        let url = "\(ApiRoutes.hackerNewsDetailsUrl)/\(ApiRoutes.hackerNewsItem)/\(id)"
        AF.request(url, method: .get)
        .validate()
        .responseDecodable { (response: DataResponse<HackerNewsItem, AFError>) in
            completion(response.result)
        }
    }
}
