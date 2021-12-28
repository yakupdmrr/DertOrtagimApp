//
//  Utility.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 7.10.2021.
//

import Foundation
import JWTDecode


class Utility {
    
    static let instance = Utility()
    
    func getUserId() -> Int{
         var userId:Int = Int()
        do {
            let data = try decode(jwt: LoginManager.instance.getToken())
            let dataDict:[String:Any] = data.body
            guard let id = dataDict["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"] as? String else { return 0 }
            userId = Int(id) ?? 0
        }catch {
            print("UserId Alınamadı!!!")
        }
        return userId
    }
    
    func dateFormatter(date :Date) -> String{
       var createDate : String = String()
     
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd"
       createDate = formatter.string(from: date)
       
       return createDate
   }
}
            
