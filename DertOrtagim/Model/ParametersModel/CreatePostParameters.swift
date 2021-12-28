//
//  CreatePostParameters.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 12.12.2021.
//

import Foundation

struct CreatePostParameters : Codable {
    var userId:Int?
    var text:String?
    var createDate:String?
    
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        
        if userId != nil {
            dictionary["userId"] = userId
        }
        if text != nil {
            dictionary["text"] = text
        }
        if createDate != nil {
            dictionary["createDate"] = createDate
        }
        return dictionary
    }
    
    enum CodingKeys:String,CodingKey {
        case userId = "userId"
        case text = "text"
        case createDate = "createDate"
    }
}
