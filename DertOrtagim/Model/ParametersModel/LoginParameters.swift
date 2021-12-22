//
//  LoginParameter.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 10.12.2021.
//

import Foundation

struct LoginParameters : Codable {
    var userName:String?
    var password:String?
    
    func toDictionary() -> [String:Any]{
        var dictionary = [String:Any]()
        
        if userName != nil {
            dictionary["userName"] = userName
        }
        if password != nil {
            dictionary["password"] = password
        }
        return dictionary
    }
    
    enum CodingKeys:String,CodingKey {
        case userName = "userName"
        case password = "password"
    }
    
}
