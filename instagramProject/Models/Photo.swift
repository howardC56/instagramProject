//
//  Photo.swift
//  instagramProject
//
//  Created by Howard Chang on 3/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation
struct Photo {
    let photoTitle: String
    let photoDescription: String
      let photoId: String
      let postedDate: Date
      let posterName: String
      let posterId: String
      let imageURL: String
    }

    extension Photo {
      init(_ dictionary: [String: Any]) {
        self.photoTitle = dictionary["photoTitle"] as? String ?? "no name"
        self.photoDescription = dictionary["photoDescription"] as? String ?? "no description"
        self.photoId = dictionary["photoId"] as? String ?? "no government id"
        self.postedDate = dictionary["postedDate"] as? Date ?? Date()
        self.posterName = dictionary["posterName"] as? String ?? "no poster name"
        self.posterId = dictionary["posterId"] as? String ?? "no poster id"
        self.imageURL = dictionary["imageURL"] as? String ?? "poop image"
      }
}
