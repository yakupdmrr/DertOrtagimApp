//
//  Constans.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 7.10.2021.
//

import Foundation

class Constants {
    static let baseURL :String = "http://192.168.1.103:45455/api"
    
    // MARK: Register
    static let registerPath : String = baseURL + "/auths/register"
    
    // MARK: Lgin
    static let loginPath : String = baseURL + "/auths/login"
    
    // MARK: CreatePost
    static let createPostPath : String = baseURL + "/posts" // userId gelecek
    
    // MARK: GetAllPost
    static let getAllPostPath : String = baseURL + "/posts"
    
    // MARK: GetByUserId
    static let getByUserId : String = baseURL + "/users/getUserById?userId="
    
    // MARK: GetPostById
    static let getPostByIdPath : String = baseURL + "/posts/" // postId gelecek
    
    // MARK: GetLikeCount
    static let getLikeCountPath : String = baseURL + "/likes/post/" // postId gelecek
    
    // MARK: LikeAPost
    static let likeAPostPath : String  = baseURL + "/likes"
  
    // MARK: GetPostsByUserId
    static let getPostsByUserIdPath : String = baseURL + "/posts/user/" // userId gelecek
    
    // MARK: UndoLike
    static let undoLikePath : String = baseURL + "/likes" // delete operation
    
    // MARK: UpdateUserProfile
    static let updateUserProfilePath : String = baseURL + "/users" // put operation
    
    // MARK: ChangePassword
    static let changePasswordPath : String = baseURL + "/users/password" // put operation
}

