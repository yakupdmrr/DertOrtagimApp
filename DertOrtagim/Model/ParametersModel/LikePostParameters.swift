//
//  LikePostParameters.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 11.12.2021.
//

import Foundation

struct LikePostParameters {
    var userId: Int?
    var postId:Int?
    
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if userId != nil {
            dictionary["userId"] = userId
        }
        if postId != nil {
            dictionary["postId"] = postId
        }
        
        return dictionary
    }
    
    enum CodingKeys : String, CodingKey {
        case userId = "userId"
        case postId = "postId"
    }
}
