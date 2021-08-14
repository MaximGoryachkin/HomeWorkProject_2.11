//
//  RoverTableViewController.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 10.08.2021.
//

import UIKit

class RoverTableViewController: UITableViewController {

    
    
    private let photosURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=800&api_key=9Q4NCMnDV0aro3aCh6Z5iwf1RI18njvj3rgLNeeJ"
    
    private var roverPhotos: [RoverPhoto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoverPhoto()
        tableView.rowHeight = 70
        setupRefreshControl()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roverPhotos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RoverPhotoCell
        
        cell.configure(with: roverPhotos[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let roverInfoVC = segue.destination as? RoverInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        roverInfoVC.roverPhoto = roverPhotos[indexPath.row]
    }
    
    private func setRoverPhoto() {
        NetworkManager.shared.fetchData(from: photosURL) { photo in
            self.roverPhotos = photo.photos
            self.tableView.reloadData()
        }
    }

    
}

extension RoverTableViewController {
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(downloadData), for: .valueChanged)
    }
    
    @objc private func downloadData() {
        setRoverPhoto()
        if self.refreshControl != nil {
            self.refreshControl?.endRefreshing()
        }
    }
}
