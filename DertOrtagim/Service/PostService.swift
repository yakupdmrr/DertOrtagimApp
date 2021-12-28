//
//  PostService.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 23.12.2021.
//

import Foundation

class PostService :NSObject {
    static let instance = PostService()
    
    private var postModel : AlamofireManager<CreatePostResult> = AlamofireManager<CreatePostResult>()
    private var getPostModel : AlamofireManager<Post> = AlamofireManager<Post>()
    
    func createPost(parameters:CreatePostParameters,completionHandler:@escaping (CreatePostResult) -> Void) {
        
        postModel.postData(servicePath: Constants.createPostPath, parameters: parameters.toDictionary()) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
            print("Error -> \(error?.debugDescription ?? "")")
        }
    }
    
    func getAllPost(completionHandler:@escaping ([Post])-> Void){
        
        getPostModel.getAllData(servicePath: Constants.getAllPostPath) { response in
            completionHandler(response)
        } onFail: { error in
            print("Error -> \(error?.debugDescription ?? "Nil Data")")
        }

    }
    
    
}
