//
//  RoverPhotoCell.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 11.08.2021.
//

import UIKit


class RoverPhotoCell: UITableViewCell {

    @IBOutlet var solNumber: UILabel!
    @IBOutlet var roverPhoto: UIImageView!
    @IBOutlet var eathDayNumber: UILabel!
    @IBOutlet var roverName: UILabel!
    
    func configure(with photo: RoverPhoto) {
        solNumber.text = "Sol is \(photo.sol)"
        eathDayNumber.text = "Earth date is \(photo.earth_date)"
        roverName.text = "Rover name is \(photo.rover.name)"
        
        DispatchQueue.global().async {
            guard let imageURL = URL(string: photo.img_src) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.roverPhoto.image = UIImage(data: imageData)
            }
        }
    }
    
}
