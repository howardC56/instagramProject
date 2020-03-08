//
//  ProfileViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import FirebaseAuth
import Kingfisher

class ProfileViewController: UIViewController {

    private var profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    private let storageService = StorageService()
     
     private lazy var imagePickerController: UIImagePickerController = {
       let ip = UIImagePickerController()
       ip.delegate = self
       return ip
     }()
     
     private var selectedImage: UIImage? {
       didSet {
        profileView.photoButton.setImage(selectedImage, for: .normal)
       }
     }
     
     override func viewDidLoad() {
       super.viewDidLoad()
        title = "Profile"
        profileView.userNameTextField.delegate = self
       updateUI()
        profileView.photoButton.addTarget(self, action: #selector(profilePhotoButtonPressed(_:)), for: .touchUpInside)
        profileView.signOutButton.addTarget(self, action: #selector(signoutPressed(_:)), for: .touchUpInside)
        profileView.updateProfileButton.addTarget(self, action: #selector(updateProfilePressed(_:)), for: .touchUpInside)
     }
     
     private func updateUI() {
       guard let user = Auth.auth().currentUser else {
         return
       }
        profileView.emailLabel.text = user.email
       profileView.userNameTextField.text = user.displayName
        profileView.photoButton.kf.setImage(with: user.photoURL, for: .normal)
     }
     
    
    @objc func signoutPressed(_ sender: UIButton) {
    do {
              try Auth.auth().signOut()
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window else { return }
        window.rootViewController = LoginViewController()
//        navigationController?.pushViewController(LoginViewController(), animated: true)
//        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
          } catch {
              DispatchQueue.main.async {
                  self.showAlert(title: "Error signing out", message: "\(error.localizedDescription)")
              }
          }
      }
    
    @objc func updateProfilePressed(_ sender: UIButton) {
        guard let user = Auth.auth().currentUser else {
                   return
               }
        guard let displayName = profileView.userNameTextField.text,
                   !displayName.isEmpty, let selectedImage = selectedImage else {
                       print("missing fields")
                       return
               }
        let resizedImage = UIImage.resizeImage(originalImage: selectedImage, rect: profileView.photoButton.bounds)
               
               storageService.uploadPhoto(userID: user.uid, image: resizedImage) { [weak self] (result) in
                   DispatchQueue.main.async {
                       switch result {
                       case .failure(let error):
                           self?.showAlert(title: "error uploading photo", message: "\(error.localizedDescription)")
                       case .success(let url):
                           let request = Auth.auth().currentUser?.createProfileChangeRequest()
                           request?.displayName = displayName
                           request?.photoURL = url
                           request?.commitChanges(completion: { [unowned self] (error) in
                               if let error = error {
                                   self?.showAlert(title: "Profile Update", message: "Error changing profile: \(error.localizedDescription).")
                               } else {
                                   self?.showAlert(title: "Profile Update", message: "Profile successfully updated.")
                               }
                           })
                       }
                   }
               }
           }
    
    @objc func profilePhotoButtonPressed(_ sender: UIButton) {
      let alertController = UIAlertController(title: "Choose Photo Option", message: nil, preferredStyle: .actionSheet)
      let cameraAction = UIAlertAction(title: "Camera", style: .default) { alertAction in
        self.imagePickerController.sourceType = .camera
        self.present(self.imagePickerController, animated: true)
      }
      let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { alertAction in
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

}

extension ProfileViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      return
    }
    selectedImage = image
    dismiss(animated: true)
  }
}
