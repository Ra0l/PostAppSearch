//
//  AllPost.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 15/03/22.
//

import Foundation


struct AllPost: Decodable {
    
    let meta: Meta?
    let data: [Post]?
}
