//
//  DetailsView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/8/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    

    public lazy var photoImageView: UIImageView = {
           let image = UIImageView()
           image.clipsToBounds = true
           image.contentMode = .scaleAspectFill
           return image
       }()
    
    public lazy var titleLabel: UILabel = {
                 let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
                 label.textColor = .black
                 label.adjustsFontSizeToFitWidth = true
                 label.text = "Title Here"
                 label.backgroundColor = .white
                 label.numberOfLines = 0
                 return label
             }()
    
    public lazy var descriptionLabel: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.text = "Date Posted: , UserName: , Description:"
        label.backgroundColor = .white
        label.sizeToFit()
        return label
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
        photoConstraints()
        titleConstraints()
        descriptionConstraints()
    }
    
    private func photoConstraints() {
        addSubview(photoImageView)
        photoImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 15, paddingRight: 15, height: 300)
    }
    
    private func titleConstraints() {
        addSubview(titleLabel)
        titleLabel.anchor(top: photoImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, height: 40)
    }
    
    private func descriptionConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: bottomAnchor, right: titleLabel.rightAnchor, paddingTop: 20, paddingBottom: 25)
    }

}
