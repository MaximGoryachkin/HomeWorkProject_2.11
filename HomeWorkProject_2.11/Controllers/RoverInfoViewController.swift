//
//  RoverInfoViewController.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 12.08.2021.
//

import UIKit

class RoverInfoViewController: UIViewController {
    
    var roverPhoto: RoverPhoto!
    var photo: UIImage!
    
    @IBOutlet weak var roverImage: RoverPhotoImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var roverInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        fetchImage()
        
    }
    
    private func fetchImage() {
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            let stringURL = self.roverPhoto.img_src
            
            DispatchQueue.main.async {
                self.roverImage.fetchImage(from: stringURL)
                self.activityIndicator.stopAnimating()
//                self.roverInfoLabel.text = """
//                            Sol is \(self.roverPhoto.sol)
//                            Earth date is \(self.roverPhoto.earth_date)
//                            Rover is \(self.roverPhoto.rover.name)
//                    """
            }
        }
    }
}
