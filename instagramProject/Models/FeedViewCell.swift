//
//  FeedViewCell.swift
//  instagramProject
//
//  Created by Howard Chang on 3/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import Kingfisher

class FeedViewCell: UITableViewCell {

      public lazy var instaImageView: UIImageView = {
         let imageV = UIImageView()
         imageV.clipsToBounds = true
         imageV.layer.cornerRadius = 10
         imageV.contentMode = .scaleToFill
         imageV.image = UIImage(systemName: "person.fill")
         return imageV
     }()
     
     public lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.font = .boldSystemFont(ofSize: 18)
         label.textAlignment = .center
         label.adjustsFontSizeToFitWidth = true
         label.numberOfLines = 0
         return label
     }()
     
     lazy var photoDescriptionLabel: UILabel = {
         let descriptionLabel = UILabel()
         descriptionLabel.font = .systemFont(ofSize: 14)
         descriptionLabel.textAlignment = .center
         descriptionLabel.adjustsFontSizeToFitWidth = true
         descriptionLabel.numberOfLines = 0
         return descriptionLabel
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(for photo: Photo) {
      titleLabel.text = photo.photoTitle
        photoDescriptionLabel.text = photo.postedDate.description
      instaImageView.kf.setImage(with: URL(string: photo.imageURL))
    }
    
    private func commonInit() {
        backgroundColor = .systemBackground
        instaImageViewConstraints()
        titleLabelConstraints()
        photoDescriptionConstraints()
    }
    
    private func instaImageViewConstraints() {
        addSubview(instaImageView)
        instaImageView.translatesAutoresizingMaskIntoConstraints = false
        instaImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        instaImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        instaImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        instaImageView.widthAnchor.constraint(equalTo: instaImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    private func titleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: instaImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: instaImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
    private func photoDescriptionConstraints() {
        addSubview(photoDescriptionLabel)
        photoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1),
            photoDescriptionLabel.leadingAnchor.constraint(equalTo: instaImageView.trailingAnchor, constant: 8),
            photoDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }

}
