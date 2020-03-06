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
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
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
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
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
           image.contentMode = .scaleAspectFit
           image.image = UIImage(systemName: "person")
           image.layer.cornerRadius = 20
           return image
       }()
    
    public lazy var errorLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
           label.textColor = .red
        label.adjustsFontSizeToFitWidth = true
           label.backgroundColor = .white
           label.numberOfLines = 0
           return label
       }()
    
    public lazy var signUpButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        button.tintColor = .black
        button.backgroundColor = .green
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        button.clipsToBounds = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        return button
    }()
    
    public lazy var loginLabel: UILabel = {
           let label = UILabel()
           label.text = "If you have an Account --> "
           label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
           label.textColor = .black
           label.backgroundColor = .white
           label.numberOfLines = 0
           return label
       }()
    
    public lazy var accountStateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 350, y: 520, width: 50, height: 50))
        button.setTitle("Login", for: .normal)
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
        profileImageConstraint()
        emailTextFieldConstraint()
        passwordFieldConstraint()
        errorLabelConstraints()
        signUpButtonConstraint()
        loginLabelConstraints()
        accountStateButtonConstraints()
        signUpButton.layer.shadowPath = UIBezierPath(roundedRect: signUpButton.bounds, cornerRadius: 15).cgPath
    }
    
    private func profileImageConstraint() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([profileImage.centerXAnchor.constraint(equalTo: centerXAnchor), profileImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25), profileImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25), profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50)])
    }
    
    private func emailTextFieldConstraint() {
        addSubview(emailTextField)
        emailTextField.anchor(top: profileImage.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20, height: 50)
    }
    
    private func passwordFieldConstraint() {
        addSubview(passwordTextField)
        passwordTextField.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, right: emailTextField.rightAnchor, paddingTop: 15, height: 50)
    }
    
    private func errorLabelConstraints() {
        addSubview(errorLabel)
        errorLabel.anchor(top: passwordTextField.bottomAnchor, left: emailTextField.leftAnchor, right: emailTextField.rightAnchor, paddingTop: 15, height: 50)
    }
    
    private func signUpButtonConstraint() {
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor), signUpButton.widthAnchor.constraint(equalToConstant: 300), signUpButton.heightAnchor.constraint(equalToConstant: 50), signUpButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 20)])
    }
    
    private func loginLabelConstraints() {
        addSubview(loginLabel)
        loginLabel.anchor(top: signUpButton.bottomAnchor, left: emailTextField.leftAnchor, paddingTop: 20, paddingLeft: 50)
    }
    
    private func accountStateButtonConstraints() {
    addSubview(accountStateButton)
        accountStateButton.anchor(top: loginLabel.topAnchor, left: loginLabel.rightAnchor, paddingLeft: 10, width: 50, height: 22)
    }
}
