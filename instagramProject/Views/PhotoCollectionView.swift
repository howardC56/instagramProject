//
//  AddPhotoView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class PhotoCollectionView: UIView {

    public lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 11
        let numberOfItems: CGFloat = 3
        let totatSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * spacingBetweenItems
        let itemWidth: CGFloat = (maxSize.width - totatSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height * 0.20
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        collectionConstraints()
    }

    private func collectionConstraints() {
    addSubview(collectionview)
        collectionview.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
}
