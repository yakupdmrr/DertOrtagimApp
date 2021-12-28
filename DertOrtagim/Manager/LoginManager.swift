//
//  LoginManager.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 20.12.2021.
//

import Foundation

class LoginManager: NSObject {
    
    static let instance = LoginManager()
   
    func setToken(token : String){
        UserDefaults.standard.set(token, forKey: "token")
    }
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: "token") ?? ""
    }
    func setExpiration(expiration:String){
        UserDefaults.standard.set(expiration, forKey: "expiration")
    }
    func getExpiration() -> String {
        return UserDefaults.standard.string(forKey: "expiration") ?? ""
    }
}
