//
//  GetPosts.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 29.12.2021.
//

import Foundation

struct GetPosts :Codable,BaseModelProtocol {
    var success: Bool
    var message: String
    var data : [Post]
    
}
