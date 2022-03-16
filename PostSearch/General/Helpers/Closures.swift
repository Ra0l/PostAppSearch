//
//  Closures.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation

typealias ErrorHandler = (_ error: String) -> Void
typealias PostsResponseHandler = (_ objectsPosts: PostResponse) -> Void 
typealias PostsDetailResponseHandler = (_ objPost: PostResponseDetail?) -> Void
