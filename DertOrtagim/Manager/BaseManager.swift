//
//  BaseManager.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 18.10.2021.
//

import Foundation
import Alamofire


class BaseManager : NSObject {
    
    func handleResponse<T>(showSuccessAlert: Bool = true, showError: Bool = true, response: DataResponse<Result<T>, AFError>, success: ((T?) -> Void)? = nil, failure: ((ErrorStatus) -> Void)? = nil) where T: Codable {
    
        if let responseResult = response.value {
            if responseResult.success ?? false {
                if let message = responseResult.message {
                    if showSuccessAlert {
                        AlertView.instance.showMessage(message: message) {
                            success?(responseResult.data)    
                        }
                        
                    }else{
                        success?(responseResult.data)
                    }
                }else{
                    success?(responseResult.data)
                }
            }
            else {
                var errorStatus = ErrorStatus.other
                
                if let statusCode = response.response?.statusCode {
                    if statusCode == 400{
                        errorStatus = .badRequest
                    }
                    else if statusCode == 401{
                        errorStatus = .unauthorized
                    }
                    else if statusCode == 500{
                        errorStatus = .internalServer
                    }
                    else if statusCode == 404 {
                        errorStatus = .notFound
                    }
                }
                self.handleError(showError: showError, responseResult: responseResult, errorStatus: errorStatus, failure: failure)
                
            }
        } else {
            
            if showError, let message = response.error?.localizedDescription {
                AlertView.instance.showMessage(message: message) {
                    failure?(.other)
                }
            }
        }
        
    }
    
    func handleError<T>(showError: Bool, responseResult: Result<T>, errorStatus: ErrorStatus, failure: ((ErrorStatus) -> Void)? = nil) where T: Codable {
        // TODO : Burası servisten gelen yapıya göre yazılacak!!!
    }

    public enum ErrorStatus {
        case success
        case badRequest
        case unauthorized
        case forbidden
        case notFound
        case internalServer
        case badGateWay
        case other
    }
}


