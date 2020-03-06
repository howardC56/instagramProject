//
//  LoginView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    public lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tf.font = UIFont(name: "AvenirNext-Regular", size: 15)
        tf.layer.cornerRadius = 15
        tf.backgroundColor = .systemBackground
        tf.placeholder = "  Enter Email Here"
        tf.textContentType = .emailAddress
        tf.setLeftPadding(10)
        tf.setRightPadding(10)
        return tf
    }()
    
    public lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.masksToBounds = true
        tf.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tf.font = UIFont(name: "AvenirNext-Regular", size: 15)
        tf.layer.cornerRadius = 15
        tf.backgroundColor = .systemBackground
        tf.placeholder = "  Enter Password Here"
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.setLeftPadding(10)
        tf.setRightPadding(10)
        return tf
    }()
    
    private lazy var profileImage: UIImageView = {
           let image = UIImageView()
           image.clipsToBounds = true
           image.contentMode = .scaleAspectFill
           image.image = UIImage(systemName: "person")
           image.layer.cornerRadius = 25
           return image
       }()
    
    public lazy var signUpButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 350, y: 520, width: 50, height: 50))
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        button.tintColor = .black
        button.backgroundColor = .green
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: 15).cgPath
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 1.5
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
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
        profileImageConstraint()
        emailTextFieldConstraint()
        passwordFieldConstraint()
        signUpButtonConstraint()
    }
    
    private func profileImageConstraint() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([profileImage.centerYAnchor.constraint(equalTo: centerYAnchor), profileImage.widthAnchor.constraint(equalToConstant: 100), profileImage.heightAnchor.constraint(equalToConstant: 100), profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100)])
    }
    
    private func emailTextFieldConstraint() {
        addSubview(emailTextField)
        emailTextField.anchor(top: profileImage.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
    }
    
    private func passwordFieldConstraint() {
        addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, right: emailTextField.rightAnchor)
    }
    
    private func signUpButtonConstraint() {
        addSubview(signUpButton)
        NSLayoutConstraint.activate([signUpButton.centerYAnchor.constraint(equalTo: centerYAnchor), signUpButton.widthAnchor.constraint(equalToConstant: 100), signUpButton.heightAnchor.constraint(equalToConstant: 75), signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50)])
    }
}
