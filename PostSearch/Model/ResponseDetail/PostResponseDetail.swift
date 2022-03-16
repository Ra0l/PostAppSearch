//
//  PostResponseDetail.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 16/03/22.
//

import Foundation

//MARK: -- Es un objeto
struct PostResponseDetail: Decodable{
    let meta : Meta?
    let data : DataDetailResponse?
    
}
