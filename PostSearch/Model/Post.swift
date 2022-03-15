//
//  Post.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation


struct Post: Decodable {
    
    let id : Int
    let user_id: Int
    let title : String
    let body : String
    
}
