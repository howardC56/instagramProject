//
//  AddPhotoViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class PhotoCollectionViewController: UIViewController {

    private var photoCollectionView = PhotoCollectionView()
    private var listener: ListenerRegistration?
    
    override func loadView() {
        view = photoCollectionView
    }
    
    private var photos = [Photo]() {
      didSet {
        DispatchQueue.main.async {
            self.photoCollectionView.collectionview.reloadData()
        }
      }
    }
    
    lazy private var addPhoto: UIBarButtonItem = {
           [unowned self] in
           return UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(createPhoto(_:)))
           }()
    
    @objc func createPhoto(_ sender: UIBarButtonItem) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        navigationItem.rightBarButtonItem = addPhoto
        photoCollectionView.collectionview.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photoCollectionView.collectionview.delegate = self
        photoCollectionView.collectionview.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(true)
      listener = Firestore.firestore().collection(DatabaseService.photoCollection).addSnapshotListener({ [weak self] (snapshot, error) in
        if let error = error {
          DispatchQueue.main.async {
            self?.showAlert(title: "Try again later", message: "\(error.localizedDescription)")
          }
        } else if let snapshot = snapshot {
          let allPhoto = snapshot.documents.map { Photo($0.data()) }
            self?.photos = allPhoto.filter { $0.posterId == Auth.auth().currentUser?.email}
        }
      })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(true)
      listener?.remove()
    }


}

extension PhotoCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
      fatalError("could not downcaset to PhotoCollectionViewCell")
    }
    let photo = photos[indexPath.row]
    cell.configureCell(photo)
    return cell
  }
}
