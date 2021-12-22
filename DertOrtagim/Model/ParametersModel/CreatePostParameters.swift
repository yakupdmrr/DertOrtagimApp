//
//  CreatePostParameters.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 12.12.2021.
//

import Foundation

struct CreatePostParameters : Codable {
    var userdId:Int?
    var text:String?
    var createDate:String?
    
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        
        if userdId != nil {
            dictionary["userdId"] = userdId
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
        case userdId = "userdId"
        case text = "text"
        case createDate = "createDate"
    }
}
