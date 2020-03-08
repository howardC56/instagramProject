//
//  CreatePostView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class CreatePostView: UIView {
    
    public lazy var titleLabel: UITextField = {
        let tf = UITextField()
           tf.layer.masksToBounds = true
           tf.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           tf.font = UIFont(name: "AvenirNext-Regular", size: 15)
           tf.layer.borderWidth = 1
           tf.layer.borderColor = UIColor.black.cgColor
           tf.backgroundColor = .systemBackground
           tf.placeholder = "Enter Photo Title Here"
           tf.autocorrectionType = .no
           tf.setLeftPadding(10)
           tf.setRightPadding(10)
           return tf
    }()
    
    public lazy var descriptionLabel: UITextField = {
        let tf = UITextField()
           tf.layer.masksToBounds = true
           tf.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           tf.font = UIFont(name: "AvenirNext-Regular", size: 15)
           tf.layer.borderWidth = 1
           tf.layer.borderColor = UIColor.black.cgColor
           tf.backgroundColor = .systemBackground
           tf.placeholder = "Enter Description Here"
           tf.setLeftPadding(10)
           tf.setRightPadding(10)
           return tf
    }()
    
    public lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var choosePhotoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Choose Photo", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = false
        button.tintColor = .black
        button.backgroundColor = .green
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowPath = UIBezierPath(roundedRect: button.bounds, cornerRadius: 15).cgPath
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
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
        backgroundColor = .white
        titleLabelConstraints()
        descriptionLabelConstraints()
        imageViewConstraints()
        chooseImageConstraints()
    }
    
    private func titleLabelConstraints() {
    addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 25, paddingRight: 25, height: 40)
    }
    
    private func descriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, paddingTop: 20, height: 200)
    }
    
    private func imageViewConstraints() {
        addSubview(photoImageView)
        photoImageView.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 10, height: 150)
    }
    
    private func chooseImageConstraints() {
        addSubview(choosePhotoButton)
        choosePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([choosePhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor), choosePhotoButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20), choosePhotoButton.widthAnchor.constraint(equalToConstant: 200), choosePhotoButton.heightAnchor.constraint(equalToConstant: 50)])
    }

}
