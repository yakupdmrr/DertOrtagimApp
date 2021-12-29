//
//  UserService.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 12.10.2021.
//

import Foundation

class UserService: NSObject {
    
    static let instance  = UserService()
    
    private var registerModel : AlamofireManager<RegisterResult> = AlamofireManager<RegisterResult>()
    private var loginModel : AlamofireManager<LoginResult> = AlamofireManager<LoginResult>()
    private var getUser : AlamofireManager<User> = AlamofireManager<User>()
    
    func register(parameters:RegisterParameters,completionHandler : @escaping (RegisterResult) -> Void){
        registerModel.postData(servicePath: Constants.registerPath, parameters: parameters.toDictionary()) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!" ,message :error.debugDescription, type: .error)
        }
    }
    
    func login(parameters:LoginParameters,completionHandler:@escaping (LoginResult) -> Void){
        
        loginModel.postData(servicePath: Constants.loginPath, parameters: parameters.toDictionary()) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
        }
    }
    
    func getUserById(id:String,completionHandler:@escaping(User) -> Void){
        getUser.getAllData(servicePath: Constants.getByUserId + id) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
        }

    }
}
