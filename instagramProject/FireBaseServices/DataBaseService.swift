//
//  DataBaseService.swift
//  instagramProject
//
//  Created by Howard Chang on 3/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DatabaseService {
  
  static let photoCollection = "photos" // collection
  
  private let db = Firestore.firestore()
  
  public func createItem(photoTitle: String, photoDescription: Double, posterName: String, completion: @escaping (Result<String, Error>) -> ()) {
    guard let user = Auth.auth().currentUser else { return }
    
    // generate a document for the "items" collection
    let documentRef = db.collection(DatabaseService.photoCollection).document()
    db.collection(DatabaseService.photoCollection).document(documentRef.documentID).setData(["photoTitle":photoTitle,"photoDescription": photoDescription, "photoId":documentRef.documentID, "postedDate": Timestamp(date: Date()), "posterName": posterName,"posterId": user.uid]) { (error) in
      if let error = error {
        completion(.failure(error))
      } else {
        completion(.success(documentRef.documentID))
      }
    }
  }
  
}
