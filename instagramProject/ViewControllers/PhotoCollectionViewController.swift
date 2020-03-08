//
//  AddPhotoViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {

    private var photoCollectionView = PhotoCollectionView()
    
    override func loadView() {
        view = photoCollectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
    }
    


}
