//
//  RoverTableViewController.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 10.08.2021.
//

import UIKit

class RoverTableViewController: UITableViewController {
    
    private let photosURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=800&api_key=9Q4NCMnDV0aro3aCh6Z5iwf1RI18njvj3rgLNeeJ"
    
    private var photos: [RoverPhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoverPhoto()
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoverPhotoCell
        
        cell.configure(with: photos[indexPath.row])
        
        
        return cell
    }
    
    private func setRoverPhoto() {
        NetworkManager.shared.fetchData(from: photosURL) { photo in
            self.photos = photo.photos
            self.tableView.reloadData()
        }
    }

    
}

