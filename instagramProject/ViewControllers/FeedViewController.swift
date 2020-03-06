//
//  FeedViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let tableView = FeedView()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Activity Feed"

        // Do any additional setup after loading the view.
    }
    


}
