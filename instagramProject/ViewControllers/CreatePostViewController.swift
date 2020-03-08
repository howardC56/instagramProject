//
//  CreatePostViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CreatePostViewController: UIViewController {

    private var createPostView = CreatePostView()
     private let storageService = StorageService()
       
       private var selectedImage: UIImage? {
           didSet {
            createPostView.photoImageView.image = selectedImage
           }
       }
       
     private let dbService = DatabaseService()
     
       private lazy var imagePickerController: UIImagePickerController = {
           let picker = UIImagePickerController()
           picker.delegate = self
           return picker
       }()
    
    override func loadView() {
        view = createPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Post"
        navigationItem.rightBarButtonItem = CreatePhoto
        createPostView.choosePhotoButton.addTarget(self, action: #selector(showPhotoOptions(_:)), for: .touchUpInside)
    }
    
    lazy private var CreatePhoto: UIBarButtonItem = {
              [unowned self] in
        return UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(createPostPressed(_:)))
              }()
    
    @objc private func showPhotoOptions(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Photo Option", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (alertAction) in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true)
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (alertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(cameraAction)
        }
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc private func createPostPressed(_ sender: UIBarButtonItem) {
        guard let photoName = createPostView.titleLabel.text,
      !photoName.isEmpty,
            let descriptionText = createPostView.descriptionLabel.text,
      !descriptionText.isEmpty,
      let image = selectedImage else {
        showAlert(title: "Missing Fields", message: "All fields are required.")
        return
    }
        guard let displayName = Auth.auth().currentUser?.displayName else {
            showAlert(title: "Incomplete Profile", message: "Please complete your Profile.")
            return
          }
          
        let resizedImage = UIImage.resizeImage(originalImage: image, rect: createPostView.photoImageView.bounds)
        dbService.createItem(photoTitle: photoName, photoDescription: descriptionText, posterName: displayName) { [weak self] (result) in
            switch result {
            case.failure(let error):
              DispatchQueue.main.async {
                self?.showAlert(title: "Error creating item", message: "Sorry something went wrong: \(error.localizedDescription)")
              }
            case .success(let documentId):
              DispatchQueue.main.async {
                  self?.uploadPhoto(image: resizedImage, documentId: documentId)
                self?.showAlert(title: nil, message: "Successfully created your post 🥳")
              }
            }
          }
        }
    
    private func uploadPhoto(image: UIImage, documentId: String) {
        storageService.uploadPhoto(userID: documentId, image: image) { [weak self] (result) in
            DispatchQueue.main.async {
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Error uploading photo", message: "\(error.localizedDescription)")
            case .success(let url):
                self?.updateItemImageURL(url: url, documentId: documentId)
            }
            }
        }
    }
    
    private func updateItemImageURL(url: URL, documentId: String) {
       Firestore.firestore().collection(DatabaseService.photoCollection).document(documentId).updateData(["imageURL" : url.absoluteString]) { [weak self] (error) in
               DispatchQueue.main.async {
               if let error = error {
                   self?.showAlert(title: "error updating Image", message: "\(error.localizedDescription)")
               } else {
                   self?.dismiss(animated: true, completion: nil)
               }
               }
           }
       }

}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { fatalError("could not get original image")}
        selectedImage = image
        dismiss(animated: true, completion: nil)
    }
     
}
