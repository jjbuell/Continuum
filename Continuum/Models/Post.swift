//
//  Post.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class Post {
    
    var photoData: Data?
    var comments: [Comment]
    var timestamp: Date
    var caption: String
    
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 1)
        }
    }
    
    init(photo: UIImage, caption: String, timestamp: Date = Date(), comments: [Comment] = []) {
        self.caption = caption
        self.timestamp = timestamp
        self.comments = comments
        self.photo = photo //must be the last because it is a computed property
    }
} //End of class


//MARK: - Extension
extension Post: SearchableRecord {
    func matchesSearchTerm(searchTerm: String) -> Bool {
        return caption.lowercased().contains(searchTerm.lowercased())
    }
}
