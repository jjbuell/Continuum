//
//  PostController.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    
    //MARK: - Properties - Source of Truth
    static let shared = PostController()
    var posts: [Post] = []
    
    
    //MARK: - Functions (CRUD)
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void) {
        let post = Post(photo: image, caption: caption)
        posts.append(post)
    }
} //End of class

