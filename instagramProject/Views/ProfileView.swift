//
//  ProfileView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    public lazy var photoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 60
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.clipsToBounds = true
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    public lazy var userNameTextField: UITextField = {
    let tf = UITextField()
    tf.layer.masksToBounds = true
    tf.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    tf.font = UIFont(name: "AvenirNext-Regular", size: 15)
    tf.layer.borderWidth = 1
    tf.layer.borderColor = UIColor.black.cgColor
    tf.backgroundColor = .systemBackground
    tf.placeholder = "Enter UserName Here"
    tf.textContentType = .username
    tf.setLeftPadding(10)
    tf.setRightPadding(10)
    return tf
    }()
    
    public lazy var emailLabel: UILabel = {
              let label = UILabel()
              label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
              label.textColor = .black
           label.adjustsFontSizeToFitWidth = true
        label.text = "Email Here"
              label.backgroundColor = .white
              label.numberOfLines = 0
              return label
          }()
    
    public lazy var updateProfileButton: UIButton = {
           let button = UIButton(frame: CGRect(x: 350, y: 520, width: 50, height: 50))
           button.setTitle("Update Profile", for: .normal)
           button.layer.cornerRadius = 15
           button.layer.masksToBounds = false
           button.tintColor = .blue
           button.setTitleColor(.blue, for: .normal)
           button.backgroundColor = .clear
           button.layer.borderColor = UIColor.clear.cgColor
           button.layer.borderWidth = 1.5
           button.titleLabel?.adjustsFontSizeToFitWidth = true
           button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
           return button
       }()
    
    public lazy var signOutButton: UIButton = {
              let button = UIButton(frame: CGRect(x: 350, y: 520, width: 50, height: 50))
              button.setTitle("Sign Out", for: .normal)
              button.layer.cornerRadius = 15
              button.layer.masksToBounds = false
              button.tintColor = .blue
              button.setTitleColor(.blue, for: .normal)
              button.backgroundColor = .clear
              button.layer.borderColor = UIColor.clear.cgColor
              button.layer.borderWidth = 1.5
              button.titleLabel?.adjustsFontSizeToFitWidth = true
              button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
              return button
          }()

    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        photoButtonConstraints()
        userNameConstraints()
        emailLabelConstraints()
        updateProfileConstraints()
        signOutConstraints()
    }
    
    private func photoButtonConstraints() {
        addSubview(photoButton)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([photoButton.centerXAnchor.constraint(equalTo: centerXAnchor), photoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40), photoButton.heightAnchor.constraint(equalToConstant: 125), photoButton.widthAnchor.constraint(equalToConstant: 125)])
    }
    
    private func userNameConstraints() {
        addSubview(userNameTextField)
        userNameTextField.anchor(top: photoButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 40, paddingLeft: 30, paddingRight: 30, height: 40)
    }
    
    private func emailLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.anchor(top: userNameTextField.bottomAnchor, left: userNameTextField.leftAnchor, right: userNameTextField.rightAnchor, paddingTop: 20, height: 40)
    }

    private func updateProfileConstraints() {
        addSubview(updateProfileButton)
        updateProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([updateProfileButton.centerYAnchor.constraint(equalTo: centerYAnchor), updateProfileButton.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func signOutConstraints() {
        addSubview(signOutButton)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([signOutButton.centerXAnchor.constraint(equalTo: centerXAnchor), signOutButton.topAnchor.constraint(equalTo: updateProfileButton.bottomAnchor, constant: 40), signOutButton.widthAnchor.constraint(equalToConstant: 100), signOutButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
