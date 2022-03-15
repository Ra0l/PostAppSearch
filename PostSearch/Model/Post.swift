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
    
    init(response : PostResponse.DataResponse){
        self.id = response.id ?? 0
        self.user_id = response.user_id ?? 0
        self.title = response.title ?? ""
        self.body = response.body ?? ""
    }
}
