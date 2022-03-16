//
//  DataResponse.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 15/03/22.
//

import Foundation


struct DataDetailResponse: Decodable {
    let id : Int?
    let user_id : Int?
    let title : String?
    let body : String?
}
