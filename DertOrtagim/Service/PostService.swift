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
    private var getPostModel : AlamofireManager<GetPosts> = AlamofireManager<GetPosts>()
    
    func createPost(parameters:CreatePostParameters,completionHandler:@escaping (CreatePostResult) -> Void) {
        
        postModel.postData(servicePath: Constants.createPostPath, parameters: parameters.toDictionary()) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
            print("Error -> \(error?.debugDescription ?? "")")
        }
    }
    
    func getAllPost(completionHandler:@escaping (GetPosts)-> Void){
        
        getPostModel.getAllData(servicePath: Constants.getAllPostPath) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
            print("Error -> \(error?.debugDescription ?? "")")
        }

    }
    
    func getPostsById(id:String,completionHandler:@escaping (GetPosts) -> Void) {
        
        getPostModel.getAllData(servicePath: Constants.getPostsByUserIdPath + id) { response in
            completionHandler(response)
        } onFail: { error in
            AlertView.instance.showMessage(title: "Upps Bir Şeyler Ters Gitti!", message: error.debugDescription, type: .error)
            print("Error -> \(error?.debugDescription ?? "")")
        }

    }
    
    
}
