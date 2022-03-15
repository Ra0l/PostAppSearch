//
//  Pagination.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 15/03/22.
//

import Foundation

struct Pagination : Decodable {
    
    let total : Int
    let pages : Int
    let limit : Int
    let links : Links?
}
