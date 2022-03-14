//
//  Post.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation

struct Post : Codable {
    
    let id : Int
    let userId : Int
    let title : String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case title, body
    }
}
