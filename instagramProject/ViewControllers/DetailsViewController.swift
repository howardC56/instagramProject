//
//  DetailsViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/8/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    private var detailView = DetailsView()
    private var photo: Photo
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.titleLabel.text = photo.photoTitle
        detailView.descriptionLabel.text = "Date Posted: \(photo.postedDate) by \(photo.posterName) \n \(photo.photoDescription)"
        detailView.photoImageView.kf.setImage(with: URL(string: photo.imageURL))
    }
    
    init(photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
