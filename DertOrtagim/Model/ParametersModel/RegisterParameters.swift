//
//  RegisterParameter.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 10.12.2021.
//

import Foundation

struct RegisterParameters : Codable {
    var userName:String?
    var firstName:String?
    var lastName:String?
    var email:String?
    var password:String?
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if userName != nil {
            dictionary["userName"] = userName
        }
        if lastName != nil {
            dictionary["lastName"] = lastName
        }
        if firstName != nil {
            dictionary["firstName"] = firstName
        }
        if email != nil {
            dictionary["email"] = email
        }
        if password != nil  {
            dictionary["password"] = password
        }
        
        
        return dictionary
    }
    
    enum CodingKeys:String,CodingKey {
        case userName = "userName"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case password = "password"
    }
}


