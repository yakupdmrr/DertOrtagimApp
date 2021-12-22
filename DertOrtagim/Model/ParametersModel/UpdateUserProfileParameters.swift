//
//  UpdateUserProfile.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 12.12.2021.
//

import Foundation

struct UpdateUserProfileParameters : Codable {
    var userId:Int?
    var email:String?
    var firstName:String?
    var lastName:String?
    var userName:String?
    
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
        if userId != nil  {
            dictionary["userId"] = userId
        }
        
        
        return dictionary
    }
    
    enum CodingKeys:String,CodingKey {
        case userName = "userName"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case userId = "userId"
    }
}
