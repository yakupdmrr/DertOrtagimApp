//
//  PostViewModel.swift
//  DertOrtagim
//
//  Created by Yakup Demir on 28.12.2021.
//

import Foundation

struct PostViewListModel {
    var postList: [Post]
    
    func numberOfSection() -> Int {
        return self.postList.count
    }
    
    func postAtIndex(_ index:Int) -> PostViewModel {
        let post = postList[index]
        return PostViewModel(post: post)
    }
    
}

struct PostViewModel {
    let post:Post
    var id:Int{
        return post.id ?? 0
    }
    var text:String{
        return post.text ?? "nil text"
    }
    var userId:Int{
        return post.userId ?? 0
    }
    var likeCount:Int {
        return post.likeCount ?? 0
    }
    var date:String{
        return post.date ?? "nil date"
    }
    
}
