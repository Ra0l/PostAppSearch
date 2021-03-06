//
//  PostResponse.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation

struct PostResponse: Decodable {
    
    //MARK: -- Meta
    let meta : Meta?
    
    struct Meta : Decodable {
        let pagination : Pagination?
    }
    struct Pagination: Codable {
        let total, pages, page, limit: Int
        let links: Links?
    }
    struct Links: Codable {
        let current, next: String
    }
    
    
    //MARK: -- Data
    let data : [DataResponse]?
    
    struct DataResponse: Decodable {
        let id : Int?
        let user_id : Int?
        let title : String?
        let body : String?
    }
}


