//
//  MainViewController.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 14.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var roverNameTextField: UITextField!
    @IBOutlet weak var cameraNameTextField: UITextField!
    @IBOutlet weak var solNumberTextField: UITextField!

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let roverTableVC = segue.destination as? RoverTableViewController else { return }
        roverTableVC.roverName = roverNameTextField.text
        roverTableVC.solNumber = solNumberTextField.text
    }

}
