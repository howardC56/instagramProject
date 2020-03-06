//
//  FeedView.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class FeedView: UIView {
    
    lazy var tableView: UITableView = {
        let tableV = UITableView()
        tableV.rowHeight = 100
        tableV.backgroundColor = .white
        return tableV
    }()

    override init(frame:CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        tableViewConstraints()
        tableView.register(FeedViewCell.self, forCellReuseIdentifier: "FeedViewCell")
    }
    
    private func tableViewConstraints() {
           addSubview(tableView)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
       }

}
