//
//  AlamofireManager.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 7.10.2021.
//

import Foundation
import Alamofire


protocol RestApiProtocol {
    associatedtype T
    
    func getAllData(servicePath:URLConvertible,onSuccess: @escaping (T) -> Void ,  onFail: @escaping (String?) -> Void)
    func postData(servicePath:URLConvertible, parameters:Parameters?, onSuccess: @escaping (T) -> Void , onFail : @escaping (String?) -> Void )
}

class AlamofireManager<T:Codable> :RestApiProtocol {
    
     func postData(servicePath: URLConvertible, parameters: Parameters?=nil, onSuccess: @escaping (T) -> Void, onFail: @escaping (String?) -> Void) {
        
        let encoding :ParameterEncoding = JSONEncoding.default
        var headers : HTTPHeaders?
         
        if LoginManager.instance.getToken() != "" {
           headers = ["Authorization" : "Bearer \(LoginManager.instance.getToken())"]
        }
        
         AF.request(servicePath,method: .post,parameters: parameters,encoding: encoding,headers: headers).responseDecodable(of: T.self) { response in
            
            guard let item = response.value else {
                onFail("Post Error -> \(response.debugDescription)")
                return
            }
            
            onSuccess(item)
        }
    }
    
    
    func getAllData(servicePath: URLConvertible, onSuccess: @escaping (T) -> Void, onFail: @escaping (String?) -> Void) {
        
        AF.request(servicePath,method: .get).responseDecodable(of: T.self) { (response) in
            
            guard let items = response.value else {
                onFail("Get Error -> \(response.debugDescription)")
                return
            }
            onSuccess(items)
        }
    }
}

