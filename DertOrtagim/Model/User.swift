//
//  User.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 12.10.2021.
//

import Foundation

// Yapının hazırlanması için yazıldı. Sonradan üzerinde oynanacak.
class User  {
    var userName:String?
    var firstName:String?
    var lastName:String?
    var sex:Int?
    
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
        if sex != nil {
            dictionary["sex"] = sex
        }
        
        return dictionary
    }
    enum CodingKeys:String,CodingKey {
        case userName = "userName"
        case firstName = "firstName"
        case lastName = "lastName"
        case sex = "sex"
    }
    
}


