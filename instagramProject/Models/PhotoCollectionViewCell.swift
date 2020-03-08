//
//  PhotoCollectionViewCell.swift
//  instagramProject
//
//  Created by Howard Chang on 3/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    public lazy var photoImage: UIImageView = {
        let image = UIImageView()
                 image.clipsToBounds = true
                 image.contentMode = .scaleAspectFill
                 image.image = UIImage(systemName: "person")
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.black.cgColor
                 return image
    }()
    
    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        photoConstraints()
    }
    
    private func photoConstraints() {
        addSubview(photoImage)
        photoImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    public func configureCell(_ photo: Photo) {
        photoImage.kf.setImage(with: URL(string: photo.imageURL))
    }
}
