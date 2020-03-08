//
//  FeedViewController.swift
//  instagramProject
//
//  Created by Howard Chang on 3/5/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FeedViewController: UIViewController {

    let tableView = FeedView()
    private var listener: ListenerRegistration?
    
    private var photos = [Photo]() {
      didSet {
        DispatchQueue.main.async {
            self.tableView.tableView.reloadData()
        }
      }
    }

    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Activity Feed"
        tableView.tableView.dataSource = self
        tableView.tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        listener = Firestore.firestore().collection(DatabaseService.photoCollection).addSnapshotListener({ [weak self] (snapshot, error) in
          if let error = error {
            DispatchQueue.main.async {
              self?.showAlert(title: "Try again later", message: "\(error.localizedDescription)")
            }
          } else if let snapshot = snapshot {
            let photos = snapshot.documents.map { Photo($0.data()) }
            self?.photos = photos
          }
        })
      }
      
      override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        listener?.remove() 
      }
    }

    extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell", for: indexPath) as? FeedViewCell else {
          fatalError("could not downcast to FeedViewCell")
        }
        let photo = photos[indexPath.row]
        cell.configureCell(for: photo)
        return cell
      }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selected = photos[indexPath.row]
            let vc = DetailsViewController(photo: selected)
            navigationController?.pushViewController(vc, animated: true)
        }
    }


