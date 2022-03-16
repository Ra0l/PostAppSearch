//
//  PostModel.swift
//  PostSearch
//
//  Created by Raul Kevin Aliaga Shapiama on 14/03/22.
//

import Foundation
import Alamofire

struct PostFetch {
    
    func listAllwWithAlamofire(completionHandler : @escaping PostsResponseHandler) {
        
        let url = "https://gorest.co.in/public/v1/posts"
        
        AF.request(url, method: .get).response { dataResponse in
            
            dataResponse.data?.printLog()
            
            guard let arrayPosts = dataResponse.data?.toDTO(PostResponse.self) else { 
                return
            }
            completionHandler(arrayPosts)
//            completionHandler(Bool.random() ? arrayPosts : [])
            print(arrayPosts)
        }
    }
    
    
    func getDetailWithAlamofire(_ idPost: Int, completionHandler: @escaping PostsDetailResponseHandler){
        
        let url = "https://gorest.co.in/public/v1/posts/\(idPost)"
        
        AF.request(url, method: .get).response { response in
            response.data?.printLog()
            guard let objPost = response.data?.toDTO(PostResponseDetail.self) else {
                completionHandler(nil)
                //Una logica para el erro si no devuelve lana 
                return
            }
            completionHandler(objPost)
            print(objPost)
        }
    }
}
